package Compiler.RISCV.RVOperand;

public class Address extends RVImmediate
{
    private RVPhysicalRegister reg; // %hi %lo
    private RVGlobalVariable var;

    public Address(RVPhysicalRegister reg, RVGlobalVariable var)
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
