package Compiler.RISCV.RVOperand;

import Compiler.IR.Operand.Operand;
import Compiler.RISCV.RVVisitor;

public class GlobalVariable extends RVOperand
{
    private RVOperand value;
    public GlobalVariable(String name)
    {
        super(name);
    }

    public void setValue(RVOperand value)
    {
        this.value = value;
    }

    public RVOperand getValue()
    {
        return value;
    }

    @Override
    public String toString()
    {
        return name;
    }

    @Override
    public void accept(RVVisitor visitor)
    {
        visitor.visit(this);
    }
}
