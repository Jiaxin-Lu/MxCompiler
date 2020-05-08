package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.Map;

public class MoveInst extends IRInstruction
{
    private Operand src;
    private Operand dst;

    public MoveInst(BasicBlock basicBlock, Operand src, Operand dst)
    {
        super(basicBlock);
        this.src = src;
        this.dst = dst;
        resolveUsedRegister();
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
    public void resolveUsedRegister()
    {
        usedRegister.clear();
        if (src instanceof Register) usedRegister.add((Register) src);
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
        if (src == oldOperand) src = newOperand;
        resolveUsedRegister();
    }

    @Override
    public IRInstruction copyInst(Map<BasicBlock, BasicBlock> basicBlockMap, Map<Operand, Operand> registerMap)
    {
        return new MoveInst(basicBlockMap.getOrDefault(currentBlock, currentBlock),
                registerMap.getOrDefault(src, src), registerMap.getOrDefault(dst, dst));
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
//        if ((dst instanceof VirtualRegister) && (!(dst instanceof GlobalVariable))) def.add((VirtualRegister) dst);
//    }
//
//    @Override
//    public void replaceDef(VirtualRegister oldReg, VirtualRegister newReg)
//    {
//        if (dst == oldReg) dst = newReg;
//    }
//
//    @Override
//    public void replaceUsed(VirtualRegister oldReg, VirtualRegister newReg)
//    {
//        if (src == oldReg) src = newReg;
//    }
}
