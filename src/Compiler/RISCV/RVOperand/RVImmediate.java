package Compiler.RISCV.RVOperand;

import Compiler.RISCV.RVVisitor;

public class RVImmediate extends RVOperand
{
    private int imm;

    public RVImmediate(int imm)
    {
        this.imm = imm;
    }

    public int getImm()
    {
        return imm;
    }

    @Override
    public String toString()
    {
        return String.valueOf(imm);
    }
}
