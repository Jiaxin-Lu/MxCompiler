package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.*;

import java.util.Map;

public class Alloc extends IRInstruction
{
    private Operand dst;
    private Operand size;
    public Alloc(BasicBlock basicBlock,Operand size, Operand dst)
    {
        super(basicBlock);
        this.dst = dst;
        this.size = size;
        resolveUsedRegister();
    }

    public Operand getSize()
    {
        return size;
    }

    public Operand getDst()
    {
        return dst;
    }

    public void setSize(Operand size)
    {
        this.size = size;
        resolveUsedRegister();
    }

    public void setDst(Operand dst)
    {
        this.dst = dst;
    }

    @Override
    public void resolveUsedRegister()
    {
        usedRegister.clear();
        if (size instanceof Register) usedRegister.add((Register) size);
    }

    @Override
    public void setUsedRegister(Map<Register, Register> registerMap)
    {
        if (size instanceof Register) size = registerMap.get(size);
        resolveUsedRegister();
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
    public IRInstruction copyInst(Map<BasicBlock, BasicBlock> basicBlockMap, Map<Operand, Operand> registerMap)
    {
        return new Alloc(basicBlockMap.getOrDefault(currentBlock, currentBlock),
                registerMap.getOrDefault(size, size), registerMap.getOrDefault(dst, dst));
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
