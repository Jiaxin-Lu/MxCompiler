package Compiler.IR.Operand;

public abstract class Register extends Operand
{
    public Register() {}
    public Register(String name)
    {
        super(name);
    }
}
