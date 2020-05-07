package Compiler.Backend;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVFunction;
import Compiler.RISCV.RVInstruction.RVInstruction;
import Compiler.RISCV.RVOperand.RVRegister;

import java.util.HashSet;
import java.util.Set;

public class LivenessAnalysis
{
    private RVFunction function;
    public LivenessAnalysis(RVFunction function)
    {
        this.function = function;
    }

    public void run()
    {
        calcDefUse(function);
        solveLiveness(function);
    }

    private void calcDefUse(RVFunction function)
    {
        for (RVBasicBlock basicBlock : function.getPreOrderBlockList())
        {
            basicBlock.used.clear();
            basicBlock.def.clear();
            basicBlock.liveIn.clear();
            basicBlock.liveOut.clear();
            for (RVInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            {
                inst.calcDefUse();
                for (RVRegister use : inst.used)
                {
                    if (!basicBlock.def.contains(use))
                        basicBlock.used.add(use);
                }
                basicBlock.def.addAll(inst.def);
            }
        }
    }

    private void solveLiveness(RVFunction function)
    {
        boolean isChanged = true;
        while (isChanged)
        {
            isChanged = false;
            for (RVBasicBlock basicBlock : function.getPreOrderBlockList())
            {
                Set<RVRegister> tmpIn = new HashSet<>(basicBlock.liveIn);
                Set<RVRegister> tmpOut = new HashSet<>(basicBlock.liveOut);
                basicBlock.liveOut.removeAll(basicBlock.def);
                basicBlock.liveIn = basicBlock.used;
                basicBlock.liveIn.addAll(basicBlock.liveOut);
                basicBlock.liveOut.clear();
                for (RVBasicBlock successor : basicBlock.getSuccessors())
                {
                    basicBlock.liveOut.addAll(successor.liveIn);
                }
                if (!(basicBlock.liveIn.equals(tmpIn) && basicBlock.liveOut.equals(tmpOut)))
                    isChanged = true;
            }
        }
    }
}
