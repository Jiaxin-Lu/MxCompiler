package Compiler.Optimization;

import Compiler.IR.IRRoot;

public abstract class Pass
{
    protected IRRoot irRoot;
    protected boolean changed;

    Pass(IRRoot irRoot)
    {
        this.irRoot = irRoot;
    }

    public boolean isChanged()
    {
        return changed;
    }

    public abstract boolean run();
}
