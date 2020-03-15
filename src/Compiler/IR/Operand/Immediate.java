package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

public class Immediate extends Operand
{
    private int imm;

    public Immediate(int imm)
    {
        this.imm = imm;
    }

    public int getImm()
    {
        return imm;
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
