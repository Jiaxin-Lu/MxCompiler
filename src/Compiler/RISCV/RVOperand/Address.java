package Compiler.RISCV.RVOperand;

public class Address extends Immediate
{
    private PhysicalRegister reg; // %hi %lo
    private GlobalVariable var;

    public Address(PhysicalRegister reg, GlobalVariable var)
    {
        super(0);
        this.reg = reg;
        this.var = var;
    }

    @Override
    public String toString()
    {
        return reg + "(" + var + ")";
    }
}
