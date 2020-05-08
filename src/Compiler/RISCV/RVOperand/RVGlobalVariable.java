package Compiler.RISCV.RVOperand;

import Compiler.IR.Operand.Operand;
import Compiler.RISCV.RVVisitor;

public class RVGlobalVariable extends RVOperand
{
    private RVOperand value;
    public RVGlobalVariable(String name)
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
