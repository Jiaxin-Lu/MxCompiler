package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

public class PhysicalRegister extends Register
{
    public PhysicalRegister() {}
    public PhysicalRegister(String name)
    {
        super(name);
    }
    //TODO : figure out : isCallerSave isCalleeSave isArgForced getFuncArgIndex isGeneral

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
