package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.BranchInst;
import Compiler.IR.IRInstruction.IRInstruction;
import Compiler.IR.IRInstruction.JumpInst;
import Compiler.IR.IRInstruction.Phi;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.Immediate;

import java.util.LinkedList;
import java.util.List;

public class CFGSimplifier extends Pass
{
    public CFGSimplifier(IRRoot irRoot)
    {
        super(irRoot);
    }

    @Override
    public boolean run()
    {
        boolean isChanged = false;
        for (Function function : irRoot.getFunctionMap().values())
        {
            isChanged |= removeBranch(function);
            isChanged |= removeSingleBranchBlock(function);
            isChanged |= removePhiWithSingleBranch(function);
            isChanged |= removeUnreachableBlock(function);
        }
        return isChanged;
    }

    public boolean run(boolean remove)
    {
        boolean isChanged = false;
        for (Function function : irRoot.getFunctionMap().values())
        {
            isChanged |= removeBranch(function);
            isChanged |= removeSingleBranchBlock(function);
            isChanged |= removeUnreachableBlock(function);
        }
        return isChanged;
    }

    public boolean removeBranch(Function function)
    {
        boolean isChanged = false;
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            if (basicBlock.tailInst instanceof BranchInst)
            {
                BranchInst branch = (BranchInst) basicBlock.tailInst;
                if (branch.getThenBlock() == branch.getElseBlock())
                {
                    isChanged = true;
                    branch.replaceInst(new JumpInst(basicBlock, branch.getThenBlock()));
                } else if (branch.getCond() instanceof Immediate)
                {
                    isChanged = true;
                    int cond = ((Immediate)branch.getCond()).getImm();
                    BasicBlock target = (cond == 1) ? branch.getThenBlock() : branch.getElseBlock();
                    BasicBlock removed = (cond == 0) ? branch.getThenBlock() : branch.getElseBlock();
                    branch.replaceInst(new JumpInst(basicBlock, target));
                    removed.removePhiUnusedBlock(basicBlock);
                    basicBlock.getSuccessors().remove(removed);
                    removed.getPredecessors().remove(basicBlock);
                }
            }
        }
        function.calcPreOrderBlockList();
        return isChanged;
    }

    public boolean removeUnreachableBlock(Function function)
    {
        boolean isChanged = false;
        List<BasicBlock> removedBlock = new LinkedList<>();
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            for (BasicBlock predecessor : basicBlock.getPredecessors())
            {
                if (!function.canReach(predecessor))
                {
                    isChanged = true;
                    removedBlock.add(predecessor);
                }
            }
        }
        for (BasicBlock basicBlock : removedBlock)
        {
            basicBlock.removeThis();
        }
        function.calcPreOrderBlockList();
        return isChanged;
    }

    public boolean removePhiWithSingleBranch(Function function)
    {
        boolean isChanged = false;
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            for (IRInstruction inst = basicBlock.headInst; inst instanceof Phi; inst = inst.getNextInst())
            {
                if (((Phi) inst).getPath().size() == 1)
                {
                    isChanged = true;
                    ((Phi) inst).eliminateSinglePath();
                }
            }
        }
        function.calcPreOrderBlockList();
        return isChanged;
    }

    public boolean removeSingleBranchBlock(Function function)
    {
        boolean isChanged = false;
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            if (basicBlock != function.getEntryBlock())
            {
                if (basicBlock.headInst == basicBlock.tailInst && basicBlock.headInst instanceof JumpInst)
                {
                    isChanged = true;
                    BasicBlock target = ((JumpInst) basicBlock.headInst).getDstBlock();
                    target.getPredecessors().remove(basicBlock);
                    for (BasicBlock predecessor : basicBlock.getPredecessors())
                    {
                        predecessor.getSuccessors().remove(basicBlock);
                        predecessor.getSuccessors().add(target);
                        target.getPredecessors().add(predecessor);
                        if (predecessor.tailInst instanceof JumpInst)
                        {
                            ((JumpInst) predecessor.tailInst).setDstBlock(target);
                        }
                        if (predecessor.tailInst instanceof BranchInst)
                        {
                            ((BranchInst) predecessor.tailInst).replaceTargetBlock(basicBlock, target);
                        }
                    }
                }
            }
        }
        function.calcPreOrderBlockList();
        return isChanged;
    }
}
