package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRRoot;

import java.util.*;

public class LoopAnalysis extends Pass
{
    private DominatorTreeConstructor dominatorTreeConstructor;

    public LoopAnalysis(IRRoot irRoot)
    {
        super(irRoot);
        this.dominatorTreeConstructor = new DominatorTreeConstructor(irRoot);
    }

    private void init(Function function)
    {
        function.loopHeader.clear();
        function.loopBacker.clear();
        function.loopGroup.clear();
        function.belongLoopHeader.clear();
        function.loopExit.clear();
    }

    @Override
    public boolean run()
    {
        dominatorTreeConstructor.run();
        for (Function function : irRoot.getFunctionMap().values())
        {
            calcLoopInfo(function);
        }
        return false;
    }

    private void calcLoopInfo(Function function)
    {
        init(function);
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            for (BasicBlock successor : basicBlock.getSuccessors())
            {
                if (successor.DominatorTreeSuccessorsAll.contains(basicBlock))
                {
                    function.loopHeader.add(successor);
                    function.loopBacker.computeIfAbsent(successor, t -> new HashSet<>());
                    function.loopBacker.get(successor).add(basicBlock);
                }
            }
        }
        Stack<BasicBlock> workList = new Stack<>();
        for (BasicBlock header : function.loopHeader)
        {
            workList.clear();
            function.loopGroup.put(header, new HashSet<>());
            function.loopGroup.get(header).add(header);
            for (BasicBlock backer : function.loopBacker.get(header))
            {
                workList.add(backer);
                function.loopGroup.get(header).add(backer);
                while (!workList.isEmpty())
                {
                    BasicBlock block = workList.pop();
                    for (BasicBlock predecessor : block.getPredecessors())
                    {
                        if (!function.loopGroup.get(header).contains(predecessor))
                        {
                            function.loopGroup.get(header).add(predecessor);
                            workList.add(predecessor);
                            function.belongLoopHeader.computeIfAbsent(predecessor, t -> new HashSet<>());
                            function.belongLoopHeader.get(predecessor).add(header);
                        }
                    }
                }
            }
        }

        for (BasicBlock header : function.loopHeader)
        {
            function.loopExit.put(header, new HashSet<>());
            for (BasicBlock member : function.loopGroup.get(header))
            {
                for (BasicBlock successor : member.getSuccessors())
                {
                    if (!function.loopGroup.get(header).contains(successor))
                    {
                        function.loopExit.get(header).add(member);
                    }
                }
            }
        }
    }
}
