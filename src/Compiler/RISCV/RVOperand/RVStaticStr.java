package Compiler.RISCV.RVOperand;

import Compiler.RISCV.RVVisitor;

public class RVStaticStr extends RVGlobalVariable
{
    private String string;
    public RVStaticStr(String name, String str)
    {
        super(name);
        this.string = str;
    }

    public boolean isSCCP = false;

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
