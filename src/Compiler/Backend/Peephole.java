package Compiler.Backend;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.IRInstruction;
import Compiler.IR.IRInstruction.Load;
import Compiler.IR.IRInstruction.Move;
import Compiler.IR.IRInstruction.Store;
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
            if (inst instanceof Load)
            {
                IRInstruction prevInst = inst.getPrevInst();
                if (prevInst instanceof Store)
                {
                    if (((Store) prevInst).getDst() == ((Load) inst).getSrc())
                    {
                        inst.replaceInst(new Move(basicBlock, ((Store) prevInst).getSrc(), ((Load) inst).getDst()));
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
            if (inst instanceof Move)
                if (((Move) inst).getDst() instanceof Register && ((Move) inst).getSrc() instanceof Register)
                {
                    PhysicalRegister reg1 = null;
                    PhysicalRegister reg2 = null;
                    if (((Move) inst).getSrc() instanceof VirtualRegister)
                        reg1 = ((VirtualRegister) ((Move) inst).getSrc()).color;
                    else if (((Move) inst).getSrc() instanceof PhysicalRegister)
                        reg1 = (PhysicalRegister) ((Move) inst).getSrc();
                    if (((Move) inst).getDst() instanceof VirtualRegister)
                        reg2 = ((VirtualRegister) ((Move) inst).getDst()).color;
                    else if (((Move) inst).getDst() instanceof PhysicalRegister)
                        reg2 = (PhysicalRegister) ((Move) inst).getDst();
                    if (reg1 != null && reg2 != null)
                        if (reg1 == reg2)
                            inst.removeThis();
                }
        }
    }
}
