package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

public class GlobalVariable extends Value
{
    public GlobalVariable(String name)
    {
        super(name);
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
