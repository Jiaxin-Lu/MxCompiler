package Compiler.Backend;

import Compiler.IR.Function;
import Compiler.IR.IRRoot;

public class functionRegProcessor
{
    private IRRoot irRoot;

    public functionRegProcessor(IRRoot irRoot)
    {
        this.irRoot = irRoot;
    }

    public void run()
    {
        for (Function function : irRoot.getFunctionMap().values())
        {

        }
    }
}
