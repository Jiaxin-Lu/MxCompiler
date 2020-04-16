package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.*;

import java.util.Map;

public class Load extends IRInstruction
{
    private Operand src;
    private Operand dst;
    private boolean isGlobal;

    private int size;
    private int offset;

    public Load(BasicBlock basicBlock, Operand src, Operand dst)
    {
        super(basicBlock);
        this.src = src;
        this.dst = dst;
        this.isGlobal = false;
        resolveUsedRegister();
    }

    public Load(BasicBlock basicBlock, Operand src, Operand dst, boolean isGlobal)
    {
        super(basicBlock);
        this.src = src;
        this.dst = dst;
        this.isGlobal = isGlobal;
        resolveUsedRegister();
    }

    public Load(BasicBlock basicBlock, Operand src, Operand dst, int size, int offset)
    {
        super(basicBlock);
        this.src = src;
        this.dst = dst;
        this.isGlobal = false;
        this.size = size;
        this.offset = offset;
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
        return (Register) dst;
    }

    @Override
    public void setOriginRegister(Register register)
    {
        dst = register;
    }

    @Override
    public void resolveUsedRegister()
    {
        usedRegister.clear();
        if (src instanceof Register) usedRegister.add((Register) src);
        else if (src instanceof Memory) usedRegister.addAll(((Memory)src).getUsedRegister());
    }

    @Override
    public void setUsedRegister(Map<Register, Register> registerMap)
    {
        if (src instanceof Register) src = registerMap.get(src);
        resolveUsedRegister();
    }

    @Override
    public void replaceUsedRegister(Operand oldOperand, Operand newOperand)
    {
        if (src instanceof Register)
        {
            if (src == oldOperand) src = newOperand;
        } else if (src instanceof Memory) ((Memory) src).replaceOperand(oldOperand, newOperand);
        resolveUsedRegister();
    }

    @Override
    public IRInstruction copyInst(Map<BasicBlock, BasicBlock> basicBlockMap, Map<Operand, Operand> registerMap)
    {
        return new Load(basicBlockMap.getOrDefault(currentBlock, currentBlock),
                registerMap.getOrDefault(src, src), registerMap.getOrDefault(dst, dst), size, offset);
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }

    @Override
    public void renameUsedRegisterSSA()
    {
        if ((src instanceof VirtualRegister) && (!(src instanceof GlobalVariable)))
            src = ((VirtualRegister) src).getSSARegister(((VirtualRegister) src).stack.peek());
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
}
