package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.Map;

public class Cmp extends IRInstruction
{
    public enum Op
    {
        LEQ, REQ, LT, RT, EQ, NEQ
    }
    private Op op;
    private Operand lhs, rhs;
    private Operand dst;

    public Cmp(BasicBlock basicBlock, Op op, Operand lhs, Operand rhs, Operand dst)
    {
        super(basicBlock);
        this.op = op;
        this.lhs = lhs;
        this.rhs = rhs;
        this.dst = dst;
        resolveUsedRegister();
    }

    public Operand getLhs()
    {
        return lhs;
    }

    public void setLhs(Operand lhs)
    {
        this.lhs = lhs;
        resolveUsedRegister();
    }

    public Operand getRhs()
    {
        return rhs;
    }

    public void setRhs(Operand rhs)
    {
        this.rhs = rhs;
        resolveUsedRegister();
    }

    public Operand getDst()
    {
        return dst;
    }

    public Op getOp()
    {
        return op;
    }

    @Override
    public Register getDefRegister()
    {
        return (Register) dst;
    }

    @Override
    public void setDefRegister(Register register)
    {
        dst = register;
    }

    @Override
    public void resolveUsedRegister()
    {
        usedRegister.clear();
        if (lhs instanceof Register) usedRegister.add((Register) lhs);
        if (rhs instanceof Register) usedRegister.add((Register) rhs);
    }

    @Override
    public void replaceUsedRegister(Operand oldOperand, Operand newOperand)
    {
        if (lhs == oldOperand) lhs = newOperand;
        if (rhs == oldOperand) rhs = newOperand;
        resolveUsedRegister();
    }

    @Override
    public void setUsedRegister(Map<Register, Register> registerMap)
    {
        if (lhs instanceof Register) lhs = registerMap.get(lhs);
        if (rhs instanceof Register) rhs = registerMap.get(rhs);
        resolveUsedRegister();
    }

    @Override
    public IRInstruction copyInst(Map<BasicBlock, BasicBlock> basicBlockMap, Map<Operand, Operand> registerMap)
    {
        return new Cmp(basicBlockMap.getOrDefault(currentBlock, currentBlock), op,
                registerMap.getOrDefault(lhs, lhs), registerMap.getOrDefault(rhs, rhs),
                registerMap.getOrDefault(dst, dst));
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }

    @Override
    public void renameUsedRegisterSSA()
    {
        if ((lhs instanceof VirtualRegister) && (!(lhs instanceof GlobalVariable)))
            lhs = ((VirtualRegister) lhs).getSSARegister(((VirtualRegister) lhs).stack.peek());
        if ((rhs instanceof VirtualRegister) && (!(rhs instanceof GlobalVariable)))
            rhs = ((VirtualRegister) rhs).getSSARegister(((VirtualRegister) rhs).stack.peek());
        resolveUsedRegister();
    }

    @Override
    public void renameDstRegisterSSA()
    {
        if ((dst instanceof VirtualRegister) && (!(dst instanceof GlobalVariable)))
        {
            dst = ((VirtualRegister) dst).getSSARegister(((VirtualRegister) dst).SSANewID());
        }
    }

    @Override
    public void calcDefUse()
    {
        used.clear();
        def.clear();
        if ((lhs instanceof VirtualRegister) && (!(lhs instanceof GlobalVariable))) used.add((VirtualRegister) lhs);
        if ((rhs instanceof VirtualRegister) && (!(rhs instanceof GlobalVariable))) used.add((VirtualRegister) rhs);
        if ((dst instanceof VirtualRegister) && (!(dst instanceof GlobalVariable))) def.add((VirtualRegister) dst);
    }

    @Override
    public void replaceUsed(VirtualRegister oldReg, VirtualRegister newReg)
    {
        if (lhs == oldReg) lhs = newReg;
        if (rhs == oldReg) rhs = newReg;
    }

    @Override
    public void replaceDef(VirtualRegister oldReg, VirtualRegister newReg)
    {
        if (dst == oldReg) dst = newReg;
    }

    //CSE
    public Operand preDst = null;

    public boolean isCommutative()
    {
        return (op == Op.EQ || op == Op.NEQ);
    }
}
