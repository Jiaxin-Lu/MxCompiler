package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;
import Compiler.RISCV.RVOperand.RVStaticStr;

public class StaticStr extends Memory
{
    private String value;
    public StaticStr(VirtualRegister base, String value)
    {
        super(base);
        base.isStrBase = true;
        this.value = value;
    }

    public String getValue()
    {
        return value;
    }

    public RVStaticStr rvStaticStr;

    public boolean isSCCP = false;

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
