package Compiler.RISCV.RVOperand;

public class RVVirtualRegister extends RVRegister
{
    public RVVirtualRegister(){}
    public RVVirtualRegister(String name)
    {
        super(name);
    }

    public boolean isParameter = false;

    public RVVirtualRegister(String name, RVPhysicalRegister color)
    {
        super(name, color);
    }

    @Override
    public String toString()
    {
        return color.getName();
    }
}
