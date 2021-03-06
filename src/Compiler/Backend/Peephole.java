package Compiler.Backend;


import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVFunction;
import Compiler.RISCV.RVInstruction.*;
import Compiler.RISCV.RVOperand.RVPhysicalRegister;
import Compiler.RISCV.RVOperand.RVVirtualRegister;
import Compiler.RISCV.RVRoot;

public class Peephole
{
    private RVRoot rvRoot;
    public Peephole(RVRoot rvRoot)
    {
        this.rvRoot = rvRoot;
    }

    public void run()
    {
        for (RVFunction function : rvRoot.getFunctionMap().values())
        {
            removeLoadStore(function);
            removeMove(function);
            removeSingleBranchBlock(function);
        }
    }

    private void removeLoadStore(RVFunction function)
    {
        for (RVBasicBlock basicBlock : function.getPreOrderBlockList())
        {
            for (RVInstruction inst = basicBlock.headInst.getNextInst(); inst != null; inst = inst.getNextInst())
            if (inst instanceof Load)
            {
                RVInstruction prevInst = inst.getPrevInst();
                if (prevInst instanceof Store)
                {
                    if (((Store) prevInst).getDst() == ((Load) inst).getSrc() &&
                    (((Store) prevInst).getImm() == null || ((Load) inst).getImm() == null ||
                            ((Store) prevInst).getImm().getImm() == ((Load) inst).getImm().getImm()))
                    {
                        if (((Store) prevInst).getRd() != ((Load) inst).getRd())
                        {
                            inst.replaceInst(new Move(basicBlock, ((Load) inst).getRd(), ((Store) prevInst).getRd()));
                        } else
                        {
                            inst.removeThis();
                        }
                    }
                }
            }
        }
    }

    private void removeMove(RVFunction function)
    {
        for (RVBasicBlock basicBlock : function.getPreOrderBlockList())
        {
            for (RVInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            if (inst instanceof Move)
            {
                if (((Move) inst).getRd() != null && ((Move) inst).getRs() != null)
                {
                    RVPhysicalRegister reg1 = null;
                    RVPhysicalRegister reg2 = null;
                    if (((Move) inst).getRs() instanceof RVVirtualRegister)
                        reg1 = ((Move) inst).getRs().color;
                    else if (((Move) inst).getRs() instanceof RVPhysicalRegister)
                        reg1 = (RVPhysicalRegister) ((Move) inst).getRs();
                    if (((Move) inst).getRd() instanceof RVVirtualRegister)
                        reg2 = ((Move) inst).getRd().color;
                    else if (((Move) inst).getRd() instanceof RVPhysicalRegister)
                        reg2 = (RVPhysicalRegister) ((Move) inst).getRd();
                    if (reg2 != null && reg1 == reg2)
                    {
                        inst.removeThis();
                    }
                }
            }
        }
    }

    public void removeSingleBranchBlock(RVFunction function)
    {
        for (RVBasicBlock basicBlock : function.getPreOrderBlockList())
        {
            if (basicBlock != function.getEntryBlock())
            {
                if (basicBlock.headInst == basicBlock.tailInst && basicBlock.headInst instanceof InstJ)
                {
                    RVBasicBlock target = ((InstJ) basicBlock.headInst).getDst();
                    target.getPredecessors().remove(basicBlock);
                    for (RVBasicBlock predecessor : basicBlock.getPredecessors())
                    {
                        predecessor.getSuccessors().remove(basicBlock);
                        predecessor.getSuccessors().add(target);
                        target.getPredecessors().add(predecessor);
                        for (RVInstruction inst = predecessor.headInst; inst != null; inst = inst.getNextInst())
                        {
                            if (inst instanceof InstJ && ((InstJ) inst).getDst() == basicBlock)
                            {
                                ((InstJ)inst).setDst(target);
                            } else if (inst instanceof InstB && ((InstB) inst).getDst() == basicBlock)
                            {
                                ((InstB) inst).setDst(target);
                            }
                        }
                    }
                }
            }
        }
        function.calcPreOrderBlockList();
    }
}
