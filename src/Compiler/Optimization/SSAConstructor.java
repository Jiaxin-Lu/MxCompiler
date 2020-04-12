package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.IRInstruction;
import Compiler.IR.IRInstruction.Phi;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.*;

public class SSAConstructor extends Pass
{
    SSAConstructor(IRRoot irRoot)
    {
        super(irRoot);
    }

    @Override
    public boolean run()
    {
        return false;
    }

    public void findGlobals(Function function)
    {
        function.globals.clear();
        List<BasicBlock> preOrderBlockList = function.getPreOrderBlockList();
        Set<VirtualRegister> varKill = new HashSet<>();
        for (BasicBlock basicBlock : preOrderBlockList)
        {
            varKill.clear();
            for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            {
                List<Register> usedRegister = inst.getUsedRegister();
                Register  originRegister = inst.getOriginRegister();
                for (Register register : usedRegister)
                {
                    if ((register instanceof VirtualRegister) && (!varKill.contains(register)))
                    {
                        function.globals.add((VirtualRegister) register);
                    }
                }
                if (originRegister instanceof VirtualRegister)
                {
                    varKill.add((VirtualRegister) originRegister);
                    ((VirtualRegister) originRegister).defBlocks.add(basicBlock);
                }
            }
        }
    }

    public void insertPhiFunction(Function function)
    {
        Queue<BasicBlock> workList = new LinkedList<>();
        Set<BasicBlock> visited = new HashSet<>();
        for (VirtualRegister register : function.globals)
        {
            workList.addAll(register.defBlocks);
            while (!workList.isEmpty())
            {
                BasicBlock b = workList.remove();
                for (BasicBlock d : b.DominanceFrontier)
                {
                    if (!visited.contains(d))
                    {
                        visited.add(d);
                        d.addInst2Head(new Phi(d, register));
                        workList.add(d);
                    }
                }
            }
        }
    }

    public void renameVariables(Function function)
    {
        rename(function.getEntryBlock());
    }

    private void rename(BasicBlock basicBlock)
    {
        for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
        {
            if (!(inst instanceof Phi)) break;
            VirtualRegister dst = (VirtualRegister) ((Phi) inst).getDst();
            ((Phi) inst).setDst(dst.getSSARegister(dst.SSANewID()));
        }

        for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
        {
            if (!(inst instanceof Phi))
            {
                inst.renameUsedRegisterSSA();
                inst.renameDstRegisterSSA();
            }
        }

        for (BasicBlock successor : basicBlock.getSuccessors())
        {
            for (IRInstruction inst = successor.headInst; inst != null; inst = inst.getNextInst())
            {
                if (!(inst instanceof Phi)) break;
                VirtualRegister origin = ((VirtualRegister)(((Phi) inst).getDst())).getOriginal();
                VirtualRegister src = origin.stack.empty() ? null : origin.getSSARegister(origin.stack.peek());
                ((Phi) inst).addPath(basicBlock, src);
            }
        }

        for (BasicBlock successor : basicBlock.DominatorTreeSuccessor)
        {
            rename(successor);
        }

        for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
        {
            if (inst.getOriginRegister() != null)
            {
                ((VirtualRegister)inst.getOriginRegister()).getOriginal().stack.pop();
            }
        }

    }
}
