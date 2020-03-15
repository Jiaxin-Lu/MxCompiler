package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

public class StaticStr extends StaticData
{
    private String value;
    public StaticStr(VirtualRegister base, String value)
    {
        super(base);
        this.value = value;
    }

    public String getValue()
    {
        return value;
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
