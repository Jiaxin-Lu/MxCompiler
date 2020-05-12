package Compiler.Backend;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVFunction;
import Compiler.RISCV.RVInstruction.RVInstruction;
import Compiler.RISCV.RVOperand.RVRegister;
import Compiler.RISCV.RVRoot;

import java.util.HashSet;
import java.util.List;
import java.util.Stack;

public class SpillPriorityProcessor
{
    private RVRoot rvRoot;

    public SpillPriorityProcessor(RVRoot rvRoot)
    {
        this.rvRoot = rvRoot;
    }

    public void run()
    {
        for (RVFunction function : rvRoot.getFunctionMap().values())
        {
            computeDominatorTree(function);
        }
        for (RVFunction function : rvRoot.getFunctionMap().values())
        {
            calcLoopInfo(function);
        }
        for (RVFunction function : rvRoot.getFunctionMap().values())
        {
            markSpillPriority(function);
        }
    }

    private void init(RVFunction function)
    {
        function.loopHeader.clear();
        function.loopBacker.clear();
        function.loopGroup.clear();
        function.belongLoopHeader.clear();
        function.loopExit.clear();
    }

    private void calcLoopInfo(RVFunction function)
    {
        init(function);
        for (RVBasicBlock basicBlock : function.getPreOrderBlockList())
        {
            for (RVBasicBlock successor : basicBlock.getSuccessors())
            if (successor.DominatorTreeSuccessorsAll != null)
            {
                if (successor.DominatorTreeSuccessorsAll.contains(basicBlock))
                {
                    function.loopHeader.add(successor);
                    function.loopBacker.computeIfAbsent(successor, t -> new HashSet<>());
                    function.loopBacker.get(successor).add(basicBlock);
                }
            }
        }
        Stack<RVBasicBlock> workList = new Stack<>();
        for (RVBasicBlock header : function.loopHeader)
        {
            workList.clear();
            function.loopGroup.put(header, new HashSet<>());
            function.loopGroup.get(header).add(header);
            for (RVBasicBlock backer : function.loopBacker.get(header))
            {
                workList.add(backer);
                function.loopGroup.get(header).add(backer);
                while (!workList.isEmpty())
                {
                    RVBasicBlock block = workList.pop();
                    for (RVBasicBlock predecessor : block.getPredecessors())
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

        for (RVBasicBlock header : function.loopHeader)
        {
            function.loopExit.put(header, new HashSet<>());
            for (RVBasicBlock member : function.loopGroup.get(header))
            {
                for (RVBasicBlock successor : member.getSuccessors())
                {
                    if (!function.loopGroup.get(header).contains(successor))
                    {
                        function.loopExit.get(header).add(member);
                    }
                }
            }
        }
    }

    private void markSpillPriority(RVFunction function)
    {
        for (RVBasicBlock basicBlock : function.getPreOrderBlockList())
        {
            int loopLevel = function.belongLoopHeader.get(basicBlock) == null ? 0 : function.belongLoopHeader.get(basicBlock).size();
            double spillCount = Math.pow(10, loopLevel);
            for (RVInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            {
                inst.calcDefUse();
                for (RVRegister def : inst.def)
                {
                    def.spillPriority += spillCount;
                }
                for (RVRegister use : inst.used)
                {
                    use.spillPriority += spillCount;
                }
            }
        }
    }

    public void computeDominatorTree(RVFunction function)
    {
        List<RVBasicBlock> preOrderBlockList = function.getPreOrderBlockList();
        List<RVBasicBlock> basicBlockList = preOrderBlockList.subList(1, preOrderBlockList.size());
        for (RVBasicBlock basicBlock : basicBlockList)
        {
            basicBlock.IDOM = null;
        }
        function.getEntryBlock().IDOM = function.getEntryBlock();
        boolean isChanged = true;
        while (isChanged)
        {
            isChanged = false;
            for (RVBasicBlock basicBlock : basicBlockList)
            {
                RVBasicBlock newIDOM = null;
                for (RVBasicBlock predecessor : basicBlock.getPredecessors())
                {
                    if (predecessor.IDOM != null) newIDOM = predecessor;
                }
                for (RVBasicBlock predecessor : basicBlock.getPredecessors())
                {
                    if (predecessor != newIDOM && predecessor.IDOM != null)
                    {
                        newIDOM = intersect(predecessor, newIDOM);
                    }
                }
                if (basicBlock.IDOM != newIDOM)
                {
                    basicBlock.IDOM = newIDOM;
                    isChanged = true;
                }
            }
        }
        for (RVBasicBlock basicBlock : preOrderBlockList)
        {
            basicBlock.DominatorTreeSuccessor = new HashSet<>();
        }
        for (RVBasicBlock basicBlock : basicBlockList)
        if (basicBlock.IDOM != null)
        {
            basicBlock.IDOM.DominatorTreeSuccessor.add(basicBlock);
        }
        computeDominatorTreeSuccessors(function.getEntryBlock());
    }

    public void computeDominatorTreeSuccessors(RVBasicBlock basicBlock)
    {
        basicBlock.DominatorTreeSuccessorsAll = new HashSet<>();
        basicBlock.DominatorTreeSuccessorsAll.add(basicBlock);
        for (RVBasicBlock block : basicBlock.DominatorTreeSuccessor)
        {
            computeDominatorTreeSuccessors(block);
            basicBlock.DominatorTreeSuccessorsAll.addAll(block.DominatorTreeSuccessorsAll);
        }
    }

    public RVBasicBlock intersect(RVBasicBlock basicBlock1, RVBasicBlock basicBlock2)
    {
        RVBasicBlock figure1 = basicBlock1;
        RVBasicBlock figure2 = basicBlock2;
        while (figure2 != figure1)
        {
            while (figure1.postOrderIndex < figure2.postOrderIndex) figure1 = figure1.IDOM;
            while (figure2.postOrderIndex < figure1.postOrderIndex) figure2 = figure2.IDOM;
        }
        return figure1;
    }

}
