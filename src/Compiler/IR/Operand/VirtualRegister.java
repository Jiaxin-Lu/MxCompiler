package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

public class VirtualRegister extends Register
{
    private PhysicalRegister enforcedReg = null;

    public VirtualRegister(){}
    public VirtualRegister(String name)
    {
        super(name);
    }

    public PhysicalRegister getEnforcedReg()
    {
        return enforcedReg;
    }

    public void setEnforcedReg(PhysicalRegister enforcedReg)
    {
        this.enforcedReg = enforcedReg;
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
