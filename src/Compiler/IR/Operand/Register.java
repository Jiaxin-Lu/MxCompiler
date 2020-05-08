package Compiler.IR.Operand;

import Compiler.RISCV.RVOperand.RVRegister;

public abstract class Register extends Operand
{
    public Register() {}
    public Register(String name)
    {
        super(name);
    }

    public RVRegister rvRegister = null;
}
