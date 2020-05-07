package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.Map;

public class Pop extends IRInstruction
{
    private Operand dst;

    public Pop(BasicBlock basicBlock, Operand dst)
    {
        super(basicBlock);
        this.dst = dst;
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
    }

    @Override
    public void setUsedRegister(Map<Register, Register> registerMap)
    {
    }

    @Override
    public void replaceUsedRegister(Operand oldOperand, Operand newOperand)
    {
        if (dst == oldOperand) dst = newOperand;
    }

    @Override
    public IRInstruction copyInst(Map<BasicBlock, BasicBlock> basicBlockMap, Map<Operand, Operand> registerMap)
    {
        return null;
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }

    @Override
    public void renameUsedRegisterSSA()
    {

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
//    }
//
//    @Override
//    public void replaceUsed(VirtualRegister oldReg, VirtualRegister newReg)
//    {
//
//    }
//
//    @Override
//    public void replaceDef(VirtualRegister oldReg, VirtualRegister newReg)
//    {
//
//    }
}
