package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

public class StaticVar extends StaticData
{
    public StaticVar(VirtualRegister base)
    {
        super(base);
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
