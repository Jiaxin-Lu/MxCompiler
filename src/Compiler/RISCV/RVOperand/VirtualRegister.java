package Compiler.RISCV.RVOperand;

public class VirtualRegister extends RVRegister
{
    public VirtualRegister(){}
    public VirtualRegister(String name)
    {
        super(name);
    }

    public boolean isParameter = false;

    public VirtualRegister(String name, PhysicalRegister color)
    {
        super(name, color);
    }

    @Override
    public String toString()
    {
        return color.getName();
    }
}
