package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.Branch;
import Compiler.IR.IRInstruction.IRInstruction;
import Compiler.IR.IRInstruction.Jump;
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
        changed = false;
        for (Function function : irRoot.getFunctionMap().values())
        {
            changed |= removeBranch(function);
            changed |= removeUnreachableBlock(function);
        }
        return changed;
    }

    public boolean removeBranch(Function function)
    {
        boolean isChanged = false;
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            if (basicBlock.tailInst instanceof Branch)
            {
                Branch branch = (Branch) basicBlock.tailInst;
                if (branch.getThenBlock() == branch.getElseBlock())
                {
                    isChanged = true;
                    branch.replaceInst(new Jump(basicBlock, branch.getThenBlock()));
                } else if (branch.getCond() instanceof Immediate)
                {
                    isChanged = true;
                    int cond = ((Immediate)branch.getCond()).getImm();
                    BasicBlock target = (cond == 1) ? branch.getThenBlock() : branch.getElseBlock();
                    BasicBlock removed = (cond == 0) ? branch.getThenBlock() : branch.getElseBlock();
                    branch.replaceInst(new Jump(basicBlock, target));
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
        return isChanged;
    }
}
