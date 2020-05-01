package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

public class StackData extends Memory
{

    //TODO : much more to add
    public StackData(Register base)
    {
        super(base);
    }
    public StackData(Register base, Register index, Immediate scale, Immediate offset)
    {
        super(base, index, scale, offset);
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
