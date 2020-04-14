package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.Binary;
import Compiler.IR.IRInstruction.Cmp;
import Compiler.IR.IRInstruction.IRInstruction;
import Compiler.IR.IRInstruction.Move;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.Immediate;
import Compiler.IR.Operand.Operand;

import java.util.*;

//common-subexpression elimination.
public class CSE extends Pass
{
    private Set<BasicBlock> visitedBlock = new HashSet<>();
    private Map<HashInst, Operand> expressionMap = new HashMap<>();

    static class HashInst
    {
        String op;
        String lhs, rhs;

        HashInst(String op, Operand lhs, Operand rhs)
        {
            this.op = op;
            this.lhs = lhs instanceof Immediate ? String.valueOf(((Immediate) lhs).getImm()) : lhs.toString();
            this.rhs = rhs instanceof Immediate ? String.valueOf(((Immediate) rhs).getImm()) : rhs.toString();
        }

        @Override
        public boolean equals(Object o)
        {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            HashInst hashInst = (HashInst) o;
            return Objects.equals(op, hashInst.op) &&
                    Objects.equals(lhs, hashInst.lhs) &&
                    Objects.equals(rhs, hashInst.rhs);
        }

        @Override
        public int hashCode()
        {
            return Objects.hash(op, lhs, rhs);
        }
    }

    public CSE(IRRoot irRoot)
    {
        super(irRoot);
    }

    @Override
    public boolean run()
    {
        boolean isChanged = false;
        for (Function function : irRoot.getFunctionMap().values())
        {
            visitedBlock.clear();
            isChanged |= localCSE(function);
        }
        return isChanged;
    }

    private boolean localCSE(Function function)
    {
        boolean isChanged = false;
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            if (!visitedBlock.contains(basicBlock))
                isChanged |= commonSubexpressionElimination(basicBlock);
        }
        return isChanged;
    }

    private boolean commonSubexpressionElimination(BasicBlock basicBlock)
    {
        boolean isChanged = false;
        for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
        {
            if (inst instanceof Binary)
            {
                HashInst bin = new HashInst(((Binary) inst).getOp().toString(), ((Binary) inst).getLhs(), ((Binary) inst).getRhs());
                Operand dst = expressionMap.get(bin);
                if (dst != null)
                {
                    isChanged = true;
                    ((Binary) inst).preDst = dst;
                    inst.replaceInst(new Move(basicBlock, dst, ((Binary) inst).getDst()));
                } else
                {
                    ((Binary) inst).preDst = null;
                    expressionMap.put(bin, ((Binary) inst).getDst());
                    if (((Binary)inst).isCommutative())
                    {
                        HashInst bin2 = new HashInst(((Binary) inst).getOp().toString(), ((Binary) inst).getRhs(), ((Binary) inst).getLhs());
                        expressionMap.put(bin2, ((Binary) inst).getDst());
                    }
                }
            } else if (inst instanceof Cmp)
            {
                HashInst cmp = new HashInst(((Cmp) inst).getOp().toString(), ((Cmp) inst).getLhs(), ((Cmp) inst).getRhs());
                Operand dst = expressionMap.get(cmp);
                if (dst != null)
                {
                    isChanged = true;
                    ((Cmp) inst).preDst = dst;
                    inst.replaceInst(new Move(basicBlock, dst, ((Cmp) inst).getDst()));
                } else
                {
                    ((Cmp) inst).preDst = null;
                    expressionMap.put(cmp, ((Cmp) inst).getDst());
                    if (((Cmp) inst).isCommutative())
                    {
                        HashInst cmp2 = new HashInst(((Cmp) inst).getOp().toString(), ((Cmp) inst).getRhs(), ((Cmp) inst).getLhs());
                        expressionMap.put(cmp2, ((Cmp) inst).getDst());
                    }
                }
            }
        }
        for (BasicBlock successor : basicBlock.getSuccessors())
        {
            if (successor != basicBlock && successor.getPredecessors().size() == 1)
                isChanged |= commonSubexpressionElimination(successor);
        }
        for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
        {
            if (inst instanceof Binary)
            {
                HashInst bin = new HashInst(((Binary) inst).getOp().toString(), ((Binary) inst).getLhs(), ((Binary) inst).getRhs());
                expressionMap.remove(bin);
                if (((Binary) inst).isCommutative())
                {
                    HashInst bin2 = new HashInst(((Binary) inst).getOp().toString(), ((Binary) inst).getRhs(), ((Binary) inst).getLhs());
                    expressionMap.remove(bin2);
                }
            } else if (inst instanceof Cmp)
            {
                HashInst cmp = new HashInst(((Cmp) inst).getOp().toString(), ((Cmp) inst).getLhs(), ((Cmp) inst).getRhs());
                expressionMap.remove(cmp);
                if (((Cmp) inst).isCommutative())
                {
                    HashInst cmp2 = new HashInst(((Cmp) inst).getOp().toString(), ((Cmp) inst).getRhs(), ((Cmp) inst).getLhs());
                    expressionMap.remove(cmp2);
                }
            }
        }
        return isChanged;
    }
}
