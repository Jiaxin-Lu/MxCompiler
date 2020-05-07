package Compiler.RISCV.RVOperand;

import Compiler.IR.IRVisitor;
import Compiler.RISCV.RVVisitor;

public abstract class RVOperand
{
    protected String name;
    public RVOperand() {}
    public RVOperand(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }

    public void accept(RVVisitor visitor)
    {
        visitor.visit(this);
    }
}
