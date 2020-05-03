package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;

import java.util.Map;

public class Push extends IRInstruction
{
    private Operand src;

    public Push(BasicBlock basicBlock, Operand src)
    {
        super(basicBlock);
        this.src = src;
        resolveUsedRegister();
    }

    public Operand getSrc()
    {
        return src;
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
    }

    @Override
    public void replaceUsedRegister(Operand oldOperand, Operand newOperand)
    {
        if (src == oldOperand) src = newOperand;
        resolveUsedRegister();
    }

    @Override
    public void setUsedRegister(Map<Register, Register> registerMap)
    {
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

    @Override
    public void calcDefUse()
    {
        used.clear();
        def.clear();
    }
}
