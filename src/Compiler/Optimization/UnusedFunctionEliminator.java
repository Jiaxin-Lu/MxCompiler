package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.Call;
import Compiler.IR.IRInstruction.IRInstruction;
import Compiler.IR.IRRoot;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Set;

public class UnusedFunctionEliminator extends Pass
{
    public UnusedFunctionEliminator(IRRoot irRoot)
    {
        super(irRoot);
    }

    Set<Function> functionSet = new HashSet<>();

    @Override
    public boolean run()
    {
        Function initFunction = irRoot.getFunctionMap().get("_init_");
        getUsedFunc(initFunction);
        boolean isChanged = false;
        for (Function function :irRoot.getFunctionMap().values())
        {
            if (!functionSet.contains(function))
            {
                function.isUnused = true;
                irRoot.removeFunction(function);
                isChanged = true; //necessary?
            }
        }
        return isChanged;
    }

    private void getUsedFunc(Function initFunction)
    {
        functionSet.add(initFunction);
        Queue<Function> que = new LinkedList<>();
        que.offer(initFunction);
        while (!que.isEmpty())
        {
            Function func = que.poll();
            for (BasicBlock basicBlock : func.getPreOrderBlockList())
            {
                for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
                {
                    if (inst instanceof Call)
                    {
                        Function callee = ((Call) inst).getFunction();
                        if (!functionSet.contains(callee))
                        {
                            functionSet.add(callee);
                            que.offer(callee);
                        }
                    }
                }
            }
        }
    }
}
