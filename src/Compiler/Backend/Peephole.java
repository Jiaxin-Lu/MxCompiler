package Compiler.Backend;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.IRInstruction;
import Compiler.IR.IRInstruction.LoadInst;
import Compiler.IR.IRInstruction.MoveInst;
import Compiler.IR.IRInstruction.StoreInst;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.PhysicalRegister;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

public class Peephole
{
    private IRRoot irRoot;
    public Peephole(IRRoot irRoot)
    {
        this.irRoot = irRoot;
    }

    public void run()
    {
        for (Function function : irRoot.getFunctionMap().values())
        {
            removeLoadStore(function);
            removeMove(function);
        }
    }

    private void removeLoadStore(Function function)
    {
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            for (IRInstruction inst = basicBlock.headInst.getNextInst(); inst != null; inst = inst.getNextInst())
            if (inst instanceof LoadInst)
            {
                IRInstruction prevInst = inst.getPrevInst();
                if (prevInst instanceof StoreInst)
                {
                    if (((StoreInst) prevInst).getDst() == ((LoadInst) inst).getSrc())
                    {
                        if (((StoreInst) prevInst).getSrc() != ((LoadInst) inst).getDst())
                        {
                            inst.replaceInst(new MoveInst(basicBlock, ((StoreInst) prevInst).getSrc(), ((LoadInst) inst).getDst()));
                        } else
                        {
                            inst.removeThis();
                        }
                        prevInst.removeThis();
                    }
                }
            }
        }
    }

    private void removeMove(Function function)
    {
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            if (inst instanceof MoveInst)
                if (((MoveInst) inst).getDst() instanceof Register && ((MoveInst) inst).getSrc() instanceof Register)
                {
                    PhysicalRegister reg1 = null;
                    PhysicalRegister reg2 = null;
                    if (((MoveInst) inst).getSrc() instanceof VirtualRegister)
                        reg1 = ((VirtualRegister) ((MoveInst) inst).getSrc()).color;
                    else if (((MoveInst) inst).getSrc() instanceof PhysicalRegister)
                        reg1 = (PhysicalRegister) ((MoveInst) inst).getSrc();
                    if (((MoveInst) inst).getDst() instanceof VirtualRegister)
                        reg2 = ((VirtualRegister) ((MoveInst) inst).getDst()).color;
                    else if (((MoveInst) inst).getDst() instanceof PhysicalRegister)
                        reg2 = (PhysicalRegister) ((MoveInst) inst).getDst();
                    if (reg1 != null && reg2 != null)
                        if (reg1 == reg2)
                            inst.removeThis();
                }
        }
    }
}
