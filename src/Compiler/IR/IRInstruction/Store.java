package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Memory;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;

import java.util.Map;

public class Store extends IRInstruction
{
    private Operand src;
    private Operand dst;
    private boolean isGlobal;

    private int size;
    private int offset;

    public Store(BasicBlock basicBlock, Operand src, Operand dst)
    {
        super(basicBlock);
        this.src = src;
        this.dst = dst;
        this.isGlobal = false;
        resolveUsedRegister();
    }
    public Store(BasicBlock basicBlock, Operand src, Operand dst, boolean isGlobal)
    {
        super(basicBlock);
        this.src = src;
        this.dst = dst;
        this.isGlobal = isGlobal;
        resolveUsedRegister();
    }

    public Store(BasicBlock basicBlock, Operand src, Operand dst, int size, int offset)
    {
        super(basicBlock);
        this.src = src;
        this.dst = dst;
        this.size = size;
        this.offset = offset;
        this.isGlobal = false;
        resolveUsedRegister();
    }

    public Operand getSrc()
    {
        return src;
    }

    public Operand getDst()
    {
        return dst;
    }

    public boolean isGlobal()
    {
        return isGlobal;
    }

    public int getSize()
    {
        return size;
    }

    public int getOffset()
    {
        return offset;
    }

    @Override
    public Register getOriginRegister()
    {
        return null;
    }

    @Override
    public void setOriginRegister(Register register)
    {
    }

    @Override
    public void resolveUsedRegister()
    {
        usedRegister.clear();
        if (src instanceof Register) usedRegister.add((Register) src);
        if (dst instanceof Register) usedRegister.add((Register) dst);
        else if (dst instanceof Memory) usedRegister.addAll(((Memory)dst).getUsedRegister());
    }

    @Override
    public void setUsedRegister(Map<Register, Register> registerMap)
    {
        if (src instanceof Register) src = registerMap.get(src);
        if (dst instanceof Register) dst = registerMap.get(dst);
        resolveUsedRegister();
    }

    @Override
    public IRInstruction copyInst(Map<BasicBlock, BasicBlock> basicBlockMap, Map<Operand, Operand> registerMap)
    {
        return new Store(basicBlockMap.getOrDefault(currentBlock, currentBlock),
                registerMap.getOrDefault(src, src), registerMap.getOrDefault(dst, dst), size, offset);
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
