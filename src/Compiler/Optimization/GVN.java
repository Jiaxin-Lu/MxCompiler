package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.*;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.*;

import java.util.*;

public class GVN extends Pass
{
    private boolean changed = false;

    private Map<VirtualRegister, VirtualRegister> valueNumberMap = new HashMap<>();
    private Map<Map<BasicBlock, Operand>, VirtualRegister> phiMap = new HashMap<>();

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

    private Map<HashInst, VirtualRegister> expressionMap = new HashMap<>();



    public GVN(IRRoot irRoot)
    {
        super(irRoot);
    }

    @Override
    public boolean run()
    {
        changed = false;
        for (Function function : irRoot.getFunctionMap().values())
        {
            initGVN(function);
            globalValueNumbering(function.getEntryBlock());
        }
        return changed;
    }

    private Set<BasicBlock> visitedBasicBlock = new HashSet<>();

    private void initGVN(Function function)
    {
        valueNumberMap.clear();
        visitedBasicBlock.clear();
        for (GlobalVariable globalVariable : irRoot.getGlobalVariableList())
        {
            valueNumberMap.put(globalVariable, globalVariable);
        }
        for (StaticStr staticStr : irRoot.getStaticStrList())
        {
            valueNumberMap.put((VirtualRegister) staticStr.getBase(), (VirtualRegister) staticStr.getBase());
        }
        if (function.getInClassThis() != null)
        {
            VirtualRegister inClassThis = (VirtualRegister) function.getInClassThis();
            valueNumberMap.put(inClassThis, inClassThis);
        }
        for (Register reg : function.getParameterList())
        {
            VirtualRegister vReg = (VirtualRegister) reg;
            valueNumberMap.put(vReg, vReg);
        }
    }


    private void globalValueNumbering(BasicBlock basicBlock)
    {
        visitedBasicBlock.add(basicBlock);
        Set<VirtualRegister> numberedRegister = new LinkedHashSet<>();
        Set<HashInst> numberedExpr = new LinkedHashSet<>();
        IRInstruction inst;
        // process phi
        for (inst = basicBlock.headInst; inst instanceof Phi; inst = inst.getNextInst())
        {
            Operand val = ((Phi) inst).getPath().values().iterator().next();
            VirtualRegister dst = (VirtualRegister) ((Phi) inst).getDst();
            boolean meaningless = true;
            for (Operand value : ((Phi) inst).getPath().values())
            {
                if (value != val)
                {
                    meaningless = false;
                    break;
                }
            }
            if (meaningless && val instanceof VirtualRegister)
            {
                valueNumberMap.put(dst, (VirtualRegister) val);
                numberedRegister.add(dst);
                inst.removeThis();
                changed = true;
            } else {
                VirtualRegister tmp = phiMap.get(((Phi) inst).getPath());
                if (tmp != null)
                {
                    valueNumberMap.put(dst, tmp);
                    numberedRegister.add(dst);
                    inst.removeThis();
                    changed = true;
                } else
                {
                    valueNumberMap.put(dst, dst);
                    numberedRegister.add(dst);
                    phiMap.put(((Phi) inst).getPath(), dst);
                }
            }
        }
        phiMap.clear();

        //for each assignment
        for (; inst != null; inst = inst.getNextInst())
        {
            List<Register> usedReg = new ArrayList<>(inst.getUsedRegister());
            for (Register register : usedReg)
            {
                if (valueNumberMap.get(register) != register)
                {
                    inst.replaceUsedRegister(register, valueNumberMap.get(register));
                }
            }
            if (inst instanceof BinaryInst)
            {
                HashInst bin = new HashInst(((BinaryInst) inst).getOp().toString(), ((BinaryInst) inst).getLhs(), ((BinaryInst) inst).getRhs());
                VirtualRegister nDst = expressionMap.get(bin);
                VirtualRegister dst = (VirtualRegister) ((BinaryInst) inst).getDst();
                if (nDst != null)
                {
                    valueNumberMap.put(dst, nDst);
                    numberedRegister.add(dst);
                    inst.removeThis();
                    changed = true;
                } else {
                    valueNumberMap.put(dst, dst);
                    numberedRegister.add(dst);
                    expressionMap.put(bin, dst);
                    numberedExpr.add(bin);

                    if (((BinaryInst) inst).isCommutative())
                    {
                        HashInst bin2 = new HashInst(((BinaryInst) inst).getOp().toString(), ((BinaryInst) inst).getRhs(), ((BinaryInst) inst).getLhs());
                        expressionMap.put(bin2, dst);
                        numberedExpr.add(bin2);
                    }
                }
            } else if (inst instanceof UnaryInst)
            {
                HashInst unary = new HashInst(((UnaryInst) inst).getOp().toString(), ((UnaryInst) inst).getSrc());
                VirtualRegister nDst = expressionMap.get(unary);
                VirtualRegister dst = (VirtualRegister) ((UnaryInst) inst).getDst();
                if (nDst != null)
                {
                    valueNumberMap.put(dst, nDst);
                    numberedRegister.add(dst);
                    inst.removeThis();
                    changed = true;
                } else {
                    valueNumberMap.put(dst, dst);
                    numberedRegister.add(dst);
                    expressionMap.put(unary, dst);
                    numberedExpr.add(unary);
                }
            } else if (inst instanceof CmpInst)
            {
                HashInst cmp = new HashInst(((CmpInst) inst).getOp().toString(), ((CmpInst) inst).getLhs(), ((CmpInst) inst).getRhs());
                VirtualRegister nDst = expressionMap.get(cmp);
                VirtualRegister dst = (VirtualRegister) ((CmpInst) inst).getDst();
                if (nDst != null)
                {
                    valueNumberMap.put(dst, nDst);
                    numberedRegister.add(dst);
                    inst.removeThis();
                    changed = true;
                } else {
                    valueNumberMap.put(dst, dst);
                    numberedRegister.add(dst);
                    expressionMap.put(cmp, dst);
                    numberedExpr.add(cmp);

                    if (((CmpInst) inst).isCommutative())
                    {
                        HashInst cmp2 = new HashInst(((CmpInst) inst).getOp().toString(), ((CmpInst) inst).getLhs(), ((CmpInst) inst).getRhs());
                        expressionMap.put(cmp2, dst);
                        numberedExpr.add(cmp2);
                    }
                }
            } else {
                valueNumberMap.put((VirtualRegister) inst.getDefRegister(), (VirtualRegister) inst.getDefRegister());
                numberedRegister.add((VirtualRegister) inst.getDefRegister());
            }
        }

        for (BasicBlock successor : basicBlock.getSuccessors())
        {
            for (IRInstruction sucInst = successor.headInst; sucInst instanceof Phi; sucInst = sucInst.getNextInst())
            {
                for (Map.Entry<BasicBlock, Operand> entry : ((Phi) sucInst).getPath().entrySet())
                {
                    if (!(entry.getValue() instanceof VirtualRegister)) continue;
                    VirtualRegister reg = (VirtualRegister) entry.getValue();
                    VirtualRegister nReg = valueNumberMap.get(reg);
                    if (nReg != null && nReg != reg)
                    {
                        ((Phi) sucInst).getPath().put(entry.getKey(), nReg);
                    }
                }
            }
        }

        List<BasicBlock> dominatorTreeSuccessorList = new ArrayList<>(basicBlock.DominatorTreeSuccessor);
        dominatorTreeSuccessorList.sort(new PostOrderCmp());

        for (BasicBlock block : dominatorTreeSuccessorList)
        if (!visitedBasicBlock.contains(block))
        {
            globalValueNumbering(block);
        }

        for (HashInst hashInst : numberedExpr)
        {
            expressionMap.remove(hashInst);
        }
        for (VirtualRegister virtualRegister : numberedRegister)
        {
            valueNumberMap.remove(virtualRegister);
        }
    }

    static class PostOrderCmp implements Comparator<BasicBlock>
    {
        @Override
        public int compare(BasicBlock t1, BasicBlock t2)
        {
            return t2.postOrderIndex - t1.postOrderIndex;
        }
    }
}
