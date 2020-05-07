package Compiler.RISCV.RVOperand;

import Compiler.RISCV.RVVisitor;

public class StaticStr extends GlobalVariable
{
    private String string;
    public StaticStr(String name, String str)
    {
        super(name);
        this.string = str;
    }

    public String getString()
    {
        return string;
    }

    @Override
    public void accept(RVVisitor visitor)
    {
        visitor.visit(this);
    }
}
