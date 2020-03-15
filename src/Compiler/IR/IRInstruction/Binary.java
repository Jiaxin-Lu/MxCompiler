package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;

import java.util.Map;

public class Binary extends IRInstruction
{
    public enum Op
    {
        MUL, DIV, MOD, ADD, SUB, SHL, SHR, AND, XOR, OR
    }

    private Op op;
    private Operand lhs, rhs;
    private Operand dst;

    public Binary(BasicBlock basicBlock, Op op, Operand lhs, Operand rhs, Operand dst)
    {
        super(basicBlock);
        this.op = op;
        this.lhs = lhs;
        this.rhs = rhs;
        this.dst = dst;
        resolveUsedRegister();
    }

    public Op getOp()
    {
        return op;
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

    public void setDst(Operand dst)
    {
        this.dst = dst;
    }

    @Override
    public Register getOriginRegister()
    {
        return (Register) dst;
    }

    @Override
    public void setOriginRegister(Register register)
    {
        this.dst = register;
    }

    @Override
    public void resolveUsedRegister()
    {
        usedRegister.clear();
        if (lhs instanceof Register) usedRegister.add((Register) lhs);
        if (rhs instanceof Register) usedRegister.add((Register) rhs);
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
        return new Binary(basicBlockMap.getOrDefault(currentBlock, currentBlock), op,
                registerMap.getOrDefault(lhs, lhs), registerMap.getOrDefault(rhs, rhs),
                registerMap.getOrDefault(dst, dst));
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
