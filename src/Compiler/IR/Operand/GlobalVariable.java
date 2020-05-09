package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;
import Compiler.RISCV.RVOperand.RVGlobalVariable;

public class GlobalVariable extends Value
{
    private boolean isString = false;
    public GlobalVariable(String name)
    {
        super(name);
    }

    public GlobalVariable(String name, boolean isString)
    {
        super(name);
        this.isString = isString;
    }

    public boolean isString()
    {
        return isString;
    }

    private Pointer globalPtr = null;

    public void setGlobalPtr(Pointer globalPtr)
    {
        this.globalPtr = globalPtr;
    }

    public Pointer getGlobalPtr()
    {
        return globalPtr;
    }

    public RVGlobalVariable rvGlobalVariable;

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
