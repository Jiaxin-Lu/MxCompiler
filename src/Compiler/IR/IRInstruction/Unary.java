package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;

import java.util.Map;


public class Unary extends IRInstruction
{
    public enum Op
    {
        INC, DEC, NOT, NOTI, NEG, POS
    }

    private Op op;
    private Operand src;
    private Operand dst;

    public Unary(BasicBlock basicBlock, Op op, Operand src, Operand dst)
    {
        super(basicBlock);
        this.op = op;
        this.src = src;
        this.dst = dst;
        resolveUsedRegister();
    }

    public Op getOp()
    {
        return op;
    }

    public Operand getSrc()
    {
        return src;
    }

    public void setSrc(Operand src)
    {
        this.src = src;
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
        if (src instanceof Register) usedRegister.add((Register)src);
    }

    @Override
    public void setUsedRegister(Map<Register, Register> registerMap)
    {
        if (src instanceof Register) src = registerMap.get(src);
        resolveUsedRegister();
    }

    @Override
    public IRInstruction copyInst(Map<BasicBlock, BasicBlock> basicBlockMap, Map<Operand, Operand> registerMap)
    {
        return new Unary(basicBlockMap.getOrDefault(currentBlock, currentBlock), op,
                registerMap.getOrDefault(src, src), registerMap.getOrDefault(dst, dst));
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
