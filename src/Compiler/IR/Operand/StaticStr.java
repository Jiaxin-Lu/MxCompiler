package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;
import Compiler.RISCV.RVOperand.RVStaticStr;

public class StaticStr extends Memory
{
    private String value;
    public StaticStr(VirtualRegister base, String value)
    {
        super(base);
        this.value = value;
    }

    public String getValue()
    {
        return value;
    }

    public RVStaticStr rvStaticStr;

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
