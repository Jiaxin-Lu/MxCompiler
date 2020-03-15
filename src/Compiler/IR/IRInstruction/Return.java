package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;

import java.util.Map;

public class Return extends IRInstruction
{
    private Operand returnValue;

    public Return(BasicBlock basicBlock, Operand returnValue)
    {
        super(basicBlock);
        this.returnValue = returnValue;
        resolveUsedRegister();
    }

    public void setReturnValue(Operand returnValue)
    {
        this.returnValue = returnValue;
        resolveUsedRegister();
    }

    public Operand getReturnValue()
    {
        return returnValue;
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
        if (returnValue instanceof Register) usedRegister.add((Register) returnValue);
    }

    @Override
    public void setUsedRegister(Map<Register, Register> registerMap)
    {
        if (returnValue instanceof Register) returnValue = registerMap.get(returnValue);
        resolveUsedRegister();
    }

    @Override
    public IRInstruction copyInst(Map<BasicBlock, BasicBlock> basicBlockMap, Map<Operand, Operand> registerMap)
    {
        return new Return(basicBlockMap.getOrDefault(currentBlock, currentBlock),
                registerMap.getOrDefault(returnValue, returnValue));
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
