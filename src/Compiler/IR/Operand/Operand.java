package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

public abstract class Operand
{
    protected String name;
    public Operand() {}
    public Operand(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }

    public abstract void accept(IRVisitor visitor);
}
