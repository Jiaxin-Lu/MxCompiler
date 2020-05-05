package Compiler.Backend;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.*;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Value;

public class RegInBinaryProcessor
{
    private IRRoot irRoot;

    public RegInBinaryProcessor(IRRoot irRoot)
    {
        this.irRoot = irRoot;
    }

    public void run()
    {
        for (Function function : irRoot.getFunctionMap().values())
        {
            for (BasicBlock basicBlock : function.getPreOrderBlockList())
            {
                for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
                if (inst instanceof Binary)
                {
                    Operand dst = ((Binary) inst).getDst();
                    Operand lhs = ((Binary) inst).getLhs();
                    Operand rhs = ((Binary) inst).getRhs();
                    if (dst == lhs) continue;
                    if (dst == rhs)
                    {
                        if (((Binary) inst).isCommutative())
                        {
                            // dst = lhs op dst -> dst = dst op lhs
                            ((Binary) inst).setRhs(lhs);
                            ((Binary) inst).setLhs(dst);
                        } else
                        {
                            // dst = lhs op dst ->
                            // tmp = dst, dst = lhs, dst = dst op tmp
                            Value tmp = new Value();
                            inst.addPrevInst(new Move(basicBlock, rhs, tmp));
                            inst.addPrevInst(new Move(basicBlock, lhs, dst));
                            inst.replaceInst(new Binary(basicBlock, ((Binary) inst).getOp(), dst, tmp, dst));
                        }
                    } else
                    {
                        // dst = lhs op rhs ->
                        // dst = lhs, dst = dst op rhs
                        inst.addPrevInst(new Move(basicBlock, lhs, dst));
                        inst.replaceInst(new Binary(basicBlock, ((Binary) inst).getOp(), dst, rhs, dst));
                    }
                }
            }
        }
    }
}
