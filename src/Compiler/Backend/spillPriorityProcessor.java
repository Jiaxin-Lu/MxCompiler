package Compiler.Backend;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.IRInstruction;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.VirtualRegister;
import Compiler.Optimization.LoopAnalysis;

public class spillPriorityProcessor
{
    private LoopAnalysis loopAnalysis;
    private IRRoot irRoot;

    public spillPriorityProcessor(IRRoot irRoot)
    {
        this.irRoot = irRoot;
        loopAnalysis = new LoopAnalysis(irRoot);
    }

    public void run()
    {
        loopAnalysis.run();
        for (Function function : irRoot.getFunctionMap().values())
        {
            markSpillPriority(function);
        }
    }

    private void markSpillPriority(Function function)
    {
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            int loopLevel = function.belongLoopHeader.get(basicBlock) == null ? 0 : function.belongLoopHeader.get(basicBlock).size();
            double spillCount = Math.pow(10, loopLevel);
            for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            {
                inst.calcDefUse();
                for (VirtualRegister def : inst.def)
                {
                    def.spillPriority += spillCount;
                }
                for (VirtualRegister use : inst.used)
                {
                    use.spillPriority += spillCount;
                }
            }
        }
    }

}
