package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.Map;

public class ReturnInst extends IRInstruction
{
    private Operand returnValue;

    public ReturnInst(BasicBlock basicBlock, Operand returnValue)
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
        if (returnValue instanceof Register)
        {
            usedRegister.add((Register) returnValue);
            ((Register) returnValue).addUsedInst(this);
        }
    }

    @Override
    public void replaceUsedRegister(Operand oldOperand, Operand newOperand)
    {
        if (returnValue == oldOperand) returnValue = newOperand;
        resolveUsedRegister();
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
        return new ReturnInst(basicBlockMap.getOrDefault(currentBlock, currentBlock),
                registerMap.getOrDefault(returnValue, returnValue));
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }

    @Override
    public void renameUsedRegisterSSA()
    {
        if ((returnValue instanceof VirtualRegister) && (!(returnValue instanceof GlobalVariable)))
            returnValue = ((VirtualRegister) returnValue).getSSARegister(((VirtualRegister) returnValue).stack.peek());
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
//        if ((returnValue instanceof VirtualRegister) && (!(returnValue instanceof GlobalVariable))) used.add((VirtualRegister) returnValue);
//    }
//
//    @Override
//    public void replaceUsed(VirtualRegister oldReg, VirtualRegister newReg)
//    {
//        if (returnValue == oldReg) returnValue = newReg;
//    }
//
//    @Override
//    public void replaceDef(VirtualRegister oldReg, VirtualRegister newReg)
//    {
//
//    }
}
