package Compiler.IR.Operand;

public abstract class StaticData extends Memory
{
    public StaticData(VirtualRegister base)
    {
        super(base);
    }
}
