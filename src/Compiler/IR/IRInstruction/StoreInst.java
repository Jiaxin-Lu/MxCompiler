package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.*;
import Compiler.Utils.Width;

import java.util.Map;

public class StoreInst extends IRInstruction
{
    private Operand src;
    private Operand dst;
    private boolean isGlobal;

    private int size;
    private int offset;

    public StoreInst(BasicBlock basicBlock, Operand src, Operand dst)
    {
        super(basicBlock);
        this.src = src;
        this.dst = dst;
        this.isGlobal = false;
        this.size = Width.regWidth;
        this.offset = 0;
        resolveUsedRegister();
    }

    public StoreInst(BasicBlock basicBlock, Operand src, Operand dst, boolean isGlobal)
    {
        super(basicBlock);
        this.src = src;
        this.dst = dst;
        this.isGlobal = isGlobal;
        this.size = Width.regWidth;
        this.offset = 0;
        resolveUsedRegister();
    }

    public StoreInst(BasicBlock basicBlock, Operand src, Operand dst, int size, int offset)
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
    public Register getDefRegister()
    {
        return null;
    }

    @Override
    public void setDefRegister(Register register)
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
    public void replaceUsedRegister(Operand oldOperand, Operand newOperand)
    {
        if (src == oldOperand) src = newOperand;
        if (dst instanceof Register)
        {
            if (dst == oldOperand) dst = newOperand;
        } else if (dst instanceof Memory) ((Memory) dst).replaceOperand(oldOperand, newOperand);
        resolveUsedRegister();
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
        return new StoreInst(basicBlockMap.getOrDefault(currentBlock, currentBlock),
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
        if ((dst instanceof VirtualRegister) && (!(dst instanceof GlobalVariable)))
            dst = ((VirtualRegister) dst).getSSARegister(((VirtualRegister) dst).stack.peek());
        resolveUsedRegister();
    }

    @Override
    public void renameDstRegisterSSA()
    {
    }

//    @Override
//    public void calcDefUse()
//    {
//        used.clear();
//        def.clear();
//        if ((src instanceof VirtualRegister) && (!(src instanceof GlobalVariable))) used.add((VirtualRegister) src);
//        if ((dst instanceof VirtualRegister) && (!(dst instanceof GlobalVariable))) used.add((VirtualRegister) dst);
//        else if (dst instanceof Memory) used.addAll(((Memory) dst).getUsedRegister());
//    }
//
//    @Override
//    public void replaceUsed(VirtualRegister oldReg, VirtualRegister newReg)
//    {
//        if (src instanceof VirtualRegister)
//        {
//            if (src == oldReg) src = newReg;
//        }
//        if (dst instanceof VirtualRegister)
//        {
//            if (dst == oldReg) dst = newReg;
//        } else if (dst instanceof Memory)
//            ((Memory) dst).replaceOperand(oldReg, newReg);
//    }
//
//    @Override
//    public void replaceDef(VirtualRegister oldReg, VirtualRegister newReg)
//    {
//
//    }
}
