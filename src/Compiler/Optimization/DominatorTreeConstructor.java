package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRRoot;

import java.util.*;

public class DominatorTreeConstructor extends Pass
{
    DominatorTreeConstructor(IRRoot irRoot)
    {
        super(irRoot);
    }

    @Override
    public boolean run()
    {
        for (Function function : irRoot.getFunctionMap().values())
        {
            computeDominatorTree(function);
            computeDominanceFrontier(function);
        }
        for (Function function : irRoot.getFunctionMap().values())
        {
            computePostDominatorTree(function);
            computePostDominanceFrontier(function);
        }
        return true;
    }

    public void computeDominatorTree(Function function)
    {
        List<BasicBlock> preOrderBlockList = function.getPreOrderBlockList();
        List<BasicBlock> basicBlockList = preOrderBlockList.subList(1, preOrderBlockList.size());
        for (BasicBlock basicBlock : basicBlockList)
        {
            basicBlock.IDOM = null;
        }
        function.getEntryBlock().IDOM = function.getEntryBlock();
        boolean isChanged = true;
        while (isChanged)
        {
            isChanged = false;
            for (BasicBlock basicBlock : basicBlockList)
            {
                BasicBlock newIDOM = null;
                for (BasicBlock predecessor : basicBlock.getPredecessors())
                {
                    if (predecessor.IDOM != null) newIDOM = predecessor;
                }
                for (BasicBlock predecessor : basicBlock.getPredecessors())
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
        for (BasicBlock basicBlock : preOrderBlockList)
        {
            basicBlock.DominatorTreeSuccessor = new HashSet<>();
        }
        for (BasicBlock basicBlock : basicBlockList)
        {
            basicBlock.IDOM.DominatorTreeSuccessor.add(basicBlock);
        }
        computeDominatorTreeSuccessors(function.getEntryBlock());
    }

    public void computeDominatorTreeSuccessors(BasicBlock basicBlock)
    {
        basicBlock.DominatorTreeSuccessorsAll = new HashSet<>();
        basicBlock.DominatorTreeSuccessorsAll.add(basicBlock);
        for (BasicBlock block : basicBlock.DominatorTreeSuccessor)
        {
            computeDominatorTreeSuccessors(block);
            basicBlock.DominatorTreeSuccessorsAll.addAll(block.DominatorTreeSuccessorsAll);
        }
    }

    public BasicBlock intersect(BasicBlock basicBlock1, BasicBlock basicBlock2)
    {
        BasicBlock figure1 = basicBlock1;
        BasicBlock figure2 = basicBlock2;
        while (figure2 != figure1)
        {
            while (figure1.postOrderIndex < figure2.postOrderIndex) figure1 = figure1.IDOM;
            while (figure2.postOrderIndex < figure1.postOrderIndex) figure2 = figure2.IDOM;
        }
        return figure1;
    }

    public void computeDominanceFrontier(Function function)
    {
        List<BasicBlock> basicBlocks = function.getPreOrderBlockList();
        for (BasicBlock basicBlock : basicBlocks)
        {
            basicBlock.DominanceFrontier = new HashSet<>();
            if (basicBlock.getPredecessors().size() >= 2)
            {
                for (BasicBlock predecessor : basicBlock.getPredecessors())
                {
                    BasicBlock runner = predecessor;
                    while (runner != basicBlock.IDOM)
                    {
                        runner.DominanceFrontier.add(basicBlock);
                        runner = runner.IDOM;
                    }
                }
            }
        }
    }

    public void computePostDominatorTree(Function function)
    {
        List<BasicBlock> preOrderList = new LinkedList<>(function.getPreOrderBlockList());
        preOrderList.remove(function.getExitBlock());
        function.getExitBlock().postIDOM = function.getExitBlock();
        boolean isChanged = true;
        while (isChanged)
        {
            isChanged = false;
            for (BasicBlock basicBlock : preOrderList)
            {
                BasicBlock newIDOM = null;
                for (BasicBlock successor : basicBlock.getSuccessors())
                {
                    if (successor.postIDOM != null) newIDOM = successor;
                }
                for (BasicBlock successor : basicBlock.getSuccessors())
                {
                    if (successor != newIDOM && successor.postIDOM != null)
                    {
                        newIDOM = intersectPost(successor, newIDOM);
                    }
                }
                if (basicBlock.postIDOM != newIDOM)
                {
                    basicBlock.postIDOM = newIDOM;
                    isChanged = true;
                }
            }
        }
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            basicBlock.PostDominatorTreeSuccessor = new HashSet<>();
        }
        for (BasicBlock basicBlock : preOrderList)
        {
            basicBlock.postIDOM.PostDominatorTreeSuccessor.add(basicBlock);
        }
    }

    private BasicBlock intersectPost(BasicBlock basicBlock1, BasicBlock basicBlock2)
    {
        BasicBlock figure1 = basicBlock1;
        BasicBlock figure2 = basicBlock2;
        while (figure2 != figure1)
        {
            while (figure1.preOrderIndex < figure2.preOrderIndex) figure1 = figure1.postIDOM;
            while (figure2.preOrderIndex < figure1.preOrderIndex) figure2 = figure2.postIDOM;
        }
        return figure1;
    }

    public void computePostDominanceFrontier(Function function)
    {
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            if (basicBlock.getSuccessors().size() >= 2)
            {
                for (BasicBlock successor : basicBlock.getSuccessors())
                {
                    BasicBlock runner = successor;
                    while (runner != basicBlock.postIDOM)
                    {
                        runner.PostDominanceFrontier.add(basicBlock);
                        runner = runner.postIDOM;
                    }
                }
            }
        }
    }
}
