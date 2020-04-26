package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

public class GlobalVariable extends Value
{
    private boolean isString = false;
    public GlobalVariable(String name)
    {
        super(name);
    }

    public GlobalVariable(String name, boolean isString)
    {
        super(name);
        this.isString = isString;
    }

    public boolean isString()
    {
        return isString;
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
