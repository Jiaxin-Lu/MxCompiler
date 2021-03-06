package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.*;
import Compiler.Utils.Width;

import java.util.Map;

public class LoadInst extends IRInstruction
{
    private Operand src;
    private Operand dst;
    private boolean forGlobal;

    private int size;
    private int offset;

    public LoadInst(BasicBlock basicBlock, Operand src, Operand dst)
    {
        super(basicBlock);
        this.src = src;
        this.dst = dst;
        this.forGlobal = false;
        this.size = Width.regWidth;
        this.offset = 0;
        resolveUsedRegister();
    }

    public LoadInst(BasicBlock basicBlock, Operand src, Operand dst, boolean forGlobal)
    {
        super(basicBlock);
        this.src = src;
        this.dst = dst;
        this.forGlobal = forGlobal;
        this.size = Width.regWidth;
        this.offset = 0;
        resolveUsedRegister();
    }

    public LoadInst(BasicBlock basicBlock, Operand src, Operand dst, int size, int offset)
    {
        super(basicBlock);
        this.src = src;
        this.dst = dst;
        this.forGlobal = false;
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

    public boolean isForGlobal()
    {
        return forGlobal;
    }

    public int getSize()
    {
        return size;
    }

    public int getOffset()
    {
        return offset;
    }

    public void setGlobalPtr(Pointer globalPtr)
    {
        this.src = globalPtr;
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
        if (src instanceof Register)
        {
            usedRegister.add((Register) src);
            ((Register) src).addUsedInst(this);
        }
        else if (src instanceof Memory)
        {
            usedRegister.addAll(((Memory)src).getUsedRegister());
            ((Register) ((Memory)src).getUsedRegister()).addUsedInst(this);
        }
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
        return new LoadInst(basicBlockMap.getOrDefault(currentBlock, currentBlock),
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

//    @Override
//    public void calcDefUse()
//    {
//        used.clear();
//        def.clear();
//        if ((src instanceof VirtualRegister) && (!(src instanceof GlobalVariable))) used.add((VirtualRegister) src);
//        else if (src instanceof Memory) used.addAll(((Memory) src).getUsedRegister());
//        if ((dst instanceof VirtualRegister) && (!(dst instanceof GlobalVariable))) def.add((VirtualRegister) dst);
//    }
//
//    @Override
//    public void replaceUsed(VirtualRegister oldReg, VirtualRegister newReg)
//    {
//        if (src instanceof VirtualRegister)
//        {
//            if (src == oldReg) src = newReg;
//        } else if (src instanceof Memory)
//        {
//            ((Memory) src).replaceOperand(oldReg, newReg);
//        }
//    }
//
//    @Override
//    public void replaceDef(VirtualRegister oldReg, VirtualRegister newReg)
//    {
//        if (dst instanceof VirtualRegister)
//        {
//            if (dst == oldReg) dst = newReg;
//        }
//    }
}
