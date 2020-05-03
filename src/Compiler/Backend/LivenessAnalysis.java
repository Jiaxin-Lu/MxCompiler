package Compiler.Backend;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.IRInstruction;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.VirtualRegister;

import java.util.HashSet;
import java.util.Set;

public class LivenessAnalysis
{
    private IRRoot irRoot;
    public LivenessAnalysis(IRRoot irRoot)
    {
        this.irRoot = irRoot;
    }

    public void run()
    {
        for (Function function : irRoot.getFunctionMap().values())
        {
            calcDefUse(function);
            solveLiveness(function);
        }
    }

    private void calcDefUse(Function function)
    {
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            basicBlock.used.clear();
            basicBlock.def.clear();
            basicBlock.liveIn.clear();
            basicBlock.liveOut.clear();
            for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            {
                inst.calcDefUse();
                for (VirtualRegister use : inst.used)
                {
                    if (!basicBlock.def.contains(use))
                        basicBlock.used.add(use);
                }
                basicBlock.def.addAll(inst.def);
            }
        }
    }

    private void solveLiveness(Function function)
    {
        boolean isChanged = true;
        while (isChanged)
        {
            isChanged = false;
            for (BasicBlock basicBlock : function.getPreOrderBlockList())
            {
                Set<VirtualRegister> tmpIn = new HashSet<>(basicBlock.liveIn);
                Set<VirtualRegister> tmpOut = new HashSet<>(basicBlock.liveOut);
                basicBlock.liveOut.removeAll(basicBlock.def);
                basicBlock.liveIn = basicBlock.used;
                basicBlock.liveIn.addAll(basicBlock.liveOut);
                basicBlock.liveOut.clear();
                for (BasicBlock successor : basicBlock.getSuccessors())
                {
                    basicBlock.liveOut.addAll(successor.liveIn);
                }
                if (!(basicBlock.liveIn.equals(tmpIn) && basicBlock.liveOut.equals(tmpOut)))
                    isChanged = true;
            }
        }
    }
}
