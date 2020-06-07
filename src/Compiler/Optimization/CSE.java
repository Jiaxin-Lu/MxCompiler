package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.*;
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

        HashInst(String op, Operand lhs)
        {
            this.op = op;
            this.lhs = lhs instanceof Immediate ? String.valueOf(((Immediate) lhs).getImm()) : lhs.toString();
            this.rhs = "unary_null";
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
            {
                expressionMap.clear();
                isChanged |= commonSubexpressionElimination(basicBlock);
            }
        }
        return isChanged;
    }

    private boolean commonSubexpressionElimination(BasicBlock basicBlock)
    {
        boolean isChanged = false;
        for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
        {
            if (inst instanceof BinaryInst)
            {
                HashInst bin = new HashInst(((BinaryInst) inst).getOp().toString(), ((BinaryInst) inst).getLhs(), ((BinaryInst) inst).getRhs());
                Operand dst = expressionMap.get(bin);
                if (dst != null)
                {
                    isChanged = true;
                    ((BinaryInst) inst).preDst = dst;
                    inst.replaceInst(new MoveInst(basicBlock, dst, ((BinaryInst) inst).getDst()));
                } else
                {
                    ((BinaryInst) inst).preDst = null;
                    expressionMap.put(bin, ((BinaryInst) inst).getDst());
                    if (((BinaryInst)inst).isCommutative())
                    {
                        HashInst bin2 = new HashInst(((BinaryInst) inst).getOp().toString(), ((BinaryInst) inst).getRhs(), ((BinaryInst) inst).getLhs());
                        expressionMap.put(bin2, ((BinaryInst) inst).getDst());
                    }
                }
            } else if (inst instanceof CmpInst)
            {
                HashInst cmp = new HashInst(((CmpInst) inst).getOp().toString(), ((CmpInst) inst).getLhs(), ((CmpInst) inst).getRhs());
                Operand dst = expressionMap.get(cmp);
                if (dst != null)
                {
                    isChanged = true;
                    ((CmpInst) inst).preDst = dst;
                    inst.replaceInst(new MoveInst(basicBlock, dst, ((CmpInst) inst).getDst()));
                } else
                {
                    ((CmpInst) inst).preDst = null;
                    expressionMap.put(cmp, ((CmpInst) inst).getDst());
                    if (((CmpInst) inst).isCommutative())
                    {
                        HashInst cmp2 = new HashInst(((CmpInst) inst).getOp().toString(), ((CmpInst) inst).getRhs(), ((CmpInst) inst).getLhs());
                        expressionMap.put(cmp2, ((CmpInst) inst).getDst());
                    }
                }
            } else if (inst instanceof UnaryInst)
            {
                HashInst unary = new HashInst(((UnaryInst) inst).getOp().toString(), ((UnaryInst) inst).getSrc());
                Operand dst = expressionMap.get(unary);
                if (dst != null)
                {
                    isChanged = true;
                    ((UnaryInst) inst).preDst = dst;
                    inst.replaceInst(new MoveInst(basicBlock, dst, ((UnaryInst) inst).getDst()));
                } else {
                    ((UnaryInst) inst).preDst = null;
                    expressionMap.put(unary, ((UnaryInst) inst).getDst());
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
            if (inst instanceof BinaryInst)
            {
                HashInst bin = new HashInst(((BinaryInst) inst).getOp().toString(), ((BinaryInst) inst).getLhs(), ((BinaryInst) inst).getRhs());
                expressionMap.remove(bin);
                if (((BinaryInst) inst).isCommutative())
                {
                    HashInst bin2 = new HashInst(((BinaryInst) inst).getOp().toString(), ((BinaryInst) inst).getRhs(), ((BinaryInst) inst).getLhs());
                    expressionMap.remove(bin2);
                }
            } else if (inst instanceof CmpInst)
            {
                HashInst cmp = new HashInst(((CmpInst) inst).getOp().toString(), ((CmpInst) inst).getLhs(), ((CmpInst) inst).getRhs());
                expressionMap.remove(cmp);
                if (((CmpInst) inst).isCommutative())
                {
                    HashInst cmp2 = new HashInst(((CmpInst) inst).getOp().toString(), ((CmpInst) inst).getRhs(), ((CmpInst) inst).getLhs());
                    expressionMap.remove(cmp2);
                }
            } else if (inst instanceof UnaryInst)
            {
                HashInst unary = new HashInst(((UnaryInst) inst).getOp().toString(), ((UnaryInst) inst).getSrc());
                expressionMap.remove(unary);
            }
        }
        return isChanged;
    }
}
