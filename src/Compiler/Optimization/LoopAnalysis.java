package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRRoot;

import java.util.*;

public class LoopAnalysis extends Pass
{
    private DominatorTreeConstructor dominatorTreeConstructor;

    public LoopAnalysis(IRRoot irRoot, DominatorTreeConstructor dominatorTreeConstructor)
    {
        super(irRoot);
        this.dominatorTreeConstructor = dominatorTreeConstructor;
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

    public void calcLoopInfo(Function function)
    {
        init(function);
        dominatorTreeConstructor.computeDominatorTree(function);
        for (BasicBlock backer : function.getPreOrderBlockList())
        {
            for (BasicBlock header : backer.getSuccessors())
            {
                if (header.DominatorTreeSuccessorsAll.contains(backer))
                {
                    function.loopHeader.add(header);
                    function.loopBacker.computeIfAbsent(header, t -> new HashSet<>());
                    function.loopBacker.get(header).add(backer);
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
