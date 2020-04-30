package Compiler.Backend;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.*;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.*;

import java.util.LinkedList;
import java.util.List;

import static Compiler.IR.Operand.PhysicalRegister.*;

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
            loadArguments(function);
            modifyReturn(function);
            processInstruction(function);
        }
    }

    private void loadArguments(Function function)
    {
        List<Register> parameterList = new LinkedList<>();
        if (function.getInClassThis() != null)
            parameterList.add(function.getInClassThis());
        parameterList.addAll(function.getParameterList());
        for (int i = 0; i < parameterList.size(); i++)
        {
            if (i < 6)
            {
                function.getEntryBlock().headInst.addPrevInst(new Move(function.getEntryBlock(),
                        argumentVirtualRegisters.get(i), parameterList.get(i)));
            } else
            {
                StackData mem = new StackData(vrbp, null, new Immediate(0), new Immediate(8 * i + 8));
                function.getEntryBlock().headInst.addPrevInst(new Load(function.getEntryBlock(),
                        mem, parameterList.get(i), false));
            }
        }
    }

    private void modifyReturn(Function function)
    {
        Return ret = (Return) function.getExitBlock().tailInst;
        if (ret.getReturnValue() != null)
        {
            ret.addPrevInst(new Move(function.getExitBlock(), ret.getReturnValue(), vrax));
            ret.setReturnValue(vrax);
        }
    }

    private void processInstruction(Function function)
    {
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            {
                if (inst instanceof Call)
                {
                    if (((Call) inst).getFunction() == irRoot.builtinStringLength)
                    {
                        //todo
                        continue;
                    }
                } else if (inst instanceof Binary)
                {
                    switch (((Binary) inst).getOp())
                    {
                        case SHL:
                        case SHR:
                        {
                            if (((Binary) inst).getRhs() instanceof VirtualRegister)
                            {
                                inst.addPrevInst(new Move(basicBlock, ((Binary) inst).getRhs(), vrcx));
                                ((Binary) inst).setRhs(vrcx);
                            }
                            break;
                        }
                        case DIV:
                        case MOD:
                        {
                            inst.addPrevInst(new Move(basicBlock, ((Binary) inst).getLhs(), vrax));
                            inst.addPrevInst(new Move(basicBlock, rdx, vrdx));
                            inst.addPrevInst(new Move(basicBlock, ((Binary) inst).getRhs(), vrcx));
                            ((Binary) inst).setLhs(vrax);
                            ((Binary) inst).setRhs(vrcx);
                            if (((Binary) inst).getOp() == Binary.Op.DIV)
                                inst.addNextInst(new Move(basicBlock, vrax, ((Binary) inst).getDst()));
                            else
                                inst.addNextInst(new Move(basicBlock, vrdx, ((Binary) inst).getDst()));
                            inst.addNextInst(new Move(basicBlock, rdx, vrdx));
                            inst.addNextInst(new Move(basicBlock, rax, vrax));
                            ((Binary) inst).setDst(vrax);
                        }
                        default: break;
                    }
                } else if (inst instanceof Alloc)
                {
                    inst.addPrevInst(new Move(basicBlock, ((Alloc) inst).getSize(), vrdi));
                    inst.addNextInst(new Move(basicBlock, vrax, ((Alloc) inst).getDst()));;
                    ((Alloc) inst).setSize(vrdi);;
                    ((Alloc) inst).setDst(vrax);
                }
            }
        }
    }
}
