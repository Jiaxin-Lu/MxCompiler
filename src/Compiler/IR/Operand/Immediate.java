package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

public class Immediate extends Operand
{
    private int imm;
    private boolean isBool = false;

    public Immediate(int imm)
    {
        this.imm = imm;
    }

    public int getImm()
    {
        return imm;
    }

    public void setBool()
    {
        isBool = true;
    }

    public boolean isBool()
    {
        return isBool;
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
