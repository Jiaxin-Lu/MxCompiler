package Compiler.Optimization;

import Compiler.IR.IRRoot;

public class SSAConstructor extends Pass
{
    SSAConstructor(IRRoot irRoot)
    {
        super(irRoot);
    }

    @Override
    public boolean run()
    {
        return false;
    }
}
