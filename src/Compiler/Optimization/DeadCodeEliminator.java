package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.*;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.Register;

import java.util.HashSet;
import java.util.Set;

public class DeadCodeEliminator extends Pass
{
    Set<IRInstruction> markList = new HashSet<>();

    public DeadCodeEliminator(IRRoot irRoot)
    {
        super(irRoot);
    }

    @Override
    public boolean run()
    {
        changed = false;
        for (Function function : irRoot.getFunctionMap().values())
        {
            resolveDefUseChain(function);
            changed |= aggressiveDeadCodeElimination(function);
        }
        return changed;
    }

    private boolean aggressiveDeadCodeElimination(Function function)
    {
        mark(function);
        return sweep(function);
    }

    private boolean isCritical(IRInstruction inst)
    {
        return !(inst instanceof Branch || inst instanceof Jump || inst instanceof Move ||
                inst instanceof Binary || inst instanceof Unary || inst instanceof Cmp || inst instanceof Phi);
    }

    private void mark(Function function)
    {
        Set<IRInstruction> workList = new HashSet<>();
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            {
                if (isCritical(inst))
                {
                    workList.add(inst);
                    markList.add(inst);
                }
            }
        }
        while (!workList.isEmpty())
        {
            IRInstruction inst = workList.iterator().next();
            workList.remove(inst);
            for (Register u : inst.getUsedRegister())
            {
                IRInstruction defU = def.get(u);
                if (defU != null)
                {
                    if (!markList.contains(defU))
                    {
                        markList.add(defU);
                        workList.add(defU);
                    }
                }
            }
            for (BasicBlock b : inst.getCurrentBlock().PostDominanceFrontier)
            {
                IRInstruction j = b.tailInst;
                if (!markList.contains(j))
                {
                    markList.add(j);
                    workList.add(j);
                }
            }
        }
    }

    private boolean sweep(Function function)
    {
        boolean isChanged = false;
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            if (!markList.contains(inst))
            {
                if (inst instanceof Branch)
                {
                    isChanged = true;
                    basicBlock.removeTailInst();
                    basicBlock.endThis(new Jump(basicBlock, basicBlock.postIDOM));
                } else if (!(inst instanceof Jump))
                {
                    isChanged = true;
                    inst.removeThis();
                }
            }
        }
        return isChanged;
    }
}
