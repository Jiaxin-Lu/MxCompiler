package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.*;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.*;

import java.util.*;

public class LICM extends Pass
{
    private LoopAnalysis loopAnalyser;
    private boolean changed = false;
    private Set<Register> loopInvariantRegister = new LinkedHashSet<>();
    private Set<IRInstruction> loopInvariantInst = new LinkedHashSet<>();

    public LICM(IRRoot irRoot, DominatorTreeConstructor dominatorTreeConstructor)
    {
        super(irRoot);
        loopAnalyser = new LoopAnalysis(irRoot, dominatorTreeConstructor);
    }

    @Override
    public boolean run()
    {
        changed = false;
        for (Function function : irRoot.getFunctionMap().values())
        {
            loopInvariantCodeMotion(function);
        }
        return changed;
    }

    private void loopInvariantCodeMotion(Function function)
    {
        boolean isChanged = true;
        while (isChanged)
        {
            isChanged = false;
            loopInvariantRegister.clear();
//            loopInvariantInst.clear();
            function.calcPreOrderBlockList();
            resolveDefUseChain(function);
            loopAnalyser.calcLoopInfo(function);
            for (BasicBlock header : function.loopHeader)
            {
                for (BasicBlock basicBlock : function.loopGroup.get(header))
                {
                    for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
                    if (inst instanceof BinaryInst || inst instanceof UnaryInst || inst instanceof MoveInst)
                    {
                        if (inst.getDefRegister() == null) continue;
                        if (isInvariant(function, header, inst))
                        {
                            loopInvariantRegister.add(inst.getDefRegister());
//                            loopInvariantInst.add(inst);
                        }
                    }
                }
                if (!loopInvariantRegister.isEmpty())
                {
                    //create pre-header
                    BasicBlock preHeader = new BasicBlock(function, header.getName() + "_pre_header");
                    Set<BasicBlock> predecessors = new HashSet<>(header.getPredecessors());
                    for (BasicBlock predecessor : predecessors)
                    if (!function.loopGroup.get(header).contains(predecessor))
                    {
                        IRInstruction tailInst = predecessor.tailInst;
                        predecessor.getSuccessors().remove(header);
                        predecessor.getSuccessors().add(preHeader);

                        preHeader.getPredecessors().add(predecessor);

                        header.getPredecessors().remove(predecessor);

                        if (tailInst instanceof JumpInst) ((JumpInst) tailInst).setDstBlock(preHeader);
                        else if (tailInst instanceof BranchInst) ((BranchInst) tailInst).replaceTargetBlock(header, preHeader);
                    }
                    preHeader.endThis(new JumpInst(preHeader, header));

                    //move phi
                    for (IRInstruction inst = header.headInst; inst instanceof Phi; inst = inst.getNextInst())
                    {
                        Map<BasicBlock, Operand> pathOfPreHeader = new LinkedHashMap<>();
                        Map<BasicBlock, Operand> pathOfHeader = new LinkedHashMap<>();
                        for (Map.Entry<BasicBlock, Operand> entry : ((Phi) inst).getPath().entrySet())
                        {
                            BasicBlock block = entry.getKey();
                            if (!function.loopGroup.get(header).contains(block))
                            {
                                pathOfPreHeader.put(block, entry.getValue());
                            } else {
                                pathOfHeader.put(block, entry.getValue());
                            }
                        }

                        if (!pathOfPreHeader.isEmpty())
                        {
                            Value newPhiDst = new Value(((Phi) inst).getDst().getName() + "_licm_phi");
                            Phi newPhi = new Phi(preHeader, newPhiDst);
                            newPhi.setPath(pathOfPreHeader);
                            preHeader.tailInst.addPrevInst(newPhi);

                            pathOfHeader.put(preHeader, newPhiDst);
                            ((Phi) inst).setPath(pathOfHeader);
                        }
                    }

                    //move invariant
                    for (Register reg : loopInvariantRegister)
                    {
                        IRInstruction inst = def.get(reg);
                        inst.removeThis();
                        preHeader.tailInst.addPrevInst(inst);
                        inst.setCurrentBlock(preHeader);
                    }
//                    for (IRInstruction instruction : loopInvariantInst)
//                    {
//                        instruction.removeThis();
//                        preHeader.tailInst.addPrevInst(instruction);
//                        instruction.setCurrentBlock(preHeader);
//                    }
                    isChanged = true;
                    changed = true;
                    loopInvariantRegister.clear();
                    loopInvariantInst.clear();
                    break;
                }
            }
        }
    }

    private boolean isInvariant(Function function, BasicBlock header, IRInstruction inst)
    {
        for (Register reg : inst.getUsedRegister())
        {
            if (reg instanceof GlobalVariable) continue;
            if (reg instanceof VirtualRegister && ((VirtualRegister) reg).isParameter) continue;
            if (function.getParameterList().contains(reg) || function.getInClassThis() == reg) continue;
            if (loopInvariantRegister.contains(reg)) continue;
            if (def.get(reg) == null)
            {
                continue;
            }
            if (!function.loopGroup.get(header).contains(def.get(reg).getCurrentBlock()))
                continue;
            return false;
        }
        return true;
    }
}
