package Compiler.RISCV.RVOperand;

import Compiler.RISCV.RVVisitor;

public class Immediate extends RVOperand
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
    public String toString()
    {
        return String.valueOf(imm);
    }
}
