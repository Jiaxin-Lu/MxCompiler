package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.*;

import java.util.Map;

import static Compiler.IR.Operand.PhysicalRegister.*;

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
    public void replaceUsedRegister(Operand oldOperand, Operand newOperand)
    {
        if (size == oldOperand) size = newOperand;
        resolveUsedRegister();
    }

    @Override
    public void setUsedRegister(Map<Register, Register> registerMap)
    {
        if (size instanceof Register) size = registerMap.get(size);
        resolveUsedRegister();
    }

    @Override
    public Register getDefRegister()
    {
        return (Register) dst;
    }

    @Override
    public void setDefRegister(Register register)
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

    @Override
    public void renameUsedRegisterSSA()
    {
        if ((size instanceof VirtualRegister) && (!(size instanceof GlobalVariable)))
            size = ((VirtualRegister) size).getSSARegister(((VirtualRegister) size).stack.peek());
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
        if ((size instanceof VirtualRegister) && (!(size instanceof GlobalVariable))) used.add((VirtualRegister) size);
        if ((dst instanceof VirtualRegister) && (!(dst instanceof GlobalVariable))) def.add((VirtualRegister) dst);
        def.addAll(callerSaveVirtualRegisters);
        def.remove(vrsp);
        def.remove(vrbp);
    }

    @Override
    public void replaceDef(VirtualRegister oldReg, VirtualRegister newReg)
    {
        if (dst == oldReg) dst = newReg;
    }

    @Override
    public void replaceUsed(VirtualRegister oldReg, VirtualRegister newReg)
    {
        if (size == oldReg) size = newReg;
    }
}
