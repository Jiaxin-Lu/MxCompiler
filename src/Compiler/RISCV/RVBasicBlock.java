package Compiler.RISCV;

import Compiler.RISCV.RVInstruction.InstB;
import Compiler.RISCV.RVInstruction.InstJ;
import Compiler.RISCV.RVInstruction.InstJr;
import Compiler.RISCV.RVInstruction.RVInstruction;
import Compiler.RISCV.RVOperand.RVRegister;

import java.util.HashSet;
import java.util.Set;

public class RVBasicBlock
{
    public RVInstruction headInst;
    public RVInstruction tailInst;

    private RVFunction function;
    private String name;
    private Set<RVBasicBlock> predecessors = new HashSet<>();
    private Set<RVBasicBlock> successors = new HashSet<>();

    public int preOrderIndex;
    public int postOrderIndex;
    public RVBasicBlock dfsFatherBlock;
    public RVBasicBlock IDOM;
    public Set<RVBasicBlock> DominanceFrontier;
    public Set<RVBasicBlock> DominatorTreeSuccessor;
    public Set<RVBasicBlock> DominatorTreeSuccessorsAll;

    public int reverseCFGPostOrderIndex;
    public RVBasicBlock postIDOM;
    public Set<RVBasicBlock> PostDominatorTreeSuccessor;
    public Set<RVBasicBlock> PostDominanceFrontier;

    private boolean isEnded = false;

    public RVBasicBlock(RVFunction function, String name)
    {
        this.function = function;
        this.name = name;
    }

    public String getName()
    {
        return function.getName() + "_" + name;
    }

    public Set<RVBasicBlock> getSuccessors()
    {
        return successors;
    }

    public Set<RVBasicBlock> getPredecessors()
    {
        return predecessors;
    }

    public RVFunction getFunction()
    {
        return function;
    }

    public boolean isEnded()
    {
        return isEnded;
    }

    public void addSuccessor(RVBasicBlock basicBlock)
    {
        successors.add(basicBlock);
    }

    public void addPredecessor(RVBasicBlock basicBlock)
    {
        predecessors.add(basicBlock);
    }

    public void removeSuccessor(RVBasicBlock basicBlock)
    {
        if (basicBlock == null) return;
        successors.remove(basicBlock);
    }
    public void removePredecessor(RVBasicBlock basicBlock)
    {
        if (basicBlock == null) return;
        predecessors.remove(basicBlock);
    }
    public void replacePredecessor(RVBasicBlock oldBlock, RVBasicBlock newBlock)
    {
        if (oldBlock != null) predecessors.remove(oldBlock);
        predecessors.add(newBlock);
        newBlock.successors.add(this);
    }

    public void addInst2Head(RVInstruction instruction)
    {
        if (tailInst == null)
            headInst = tailInst = instruction;
        else
        {
            instruction.setNextInst(headInst);
            headInst.setPrevInst(instruction);
            headInst = instruction;
        }
    }

    public void addInst2Tail(RVInstruction instruction)
    {
        if (tailInst == null)
            headInst = tailInst = instruction;
        else
        {
            instruction.setPrevInst(tailInst);
            tailInst.setNextInst(instruction);
            tailInst = instruction;
        }
        if (instruction instanceof InstJ)
        {
            addBasicBlock(((InstJ) instruction).getDst());
        } else if (instruction instanceof InstB)
        {
            addBasicBlock(((InstB) instruction).getDst());
        }
    }

    public void removeTailInst()
    {
        isEnded = false;
        if (!(tailInst == null))
        {
            if (tailInst instanceof InstB)
            {
                removeSuccessor(((InstB) tailInst).getDst());
            } else if (tailInst instanceof InstJ)
            {
                removeSuccessor(((InstJ) tailInst).getDst());
            }
            tailInst = tailInst.getPrevInst();
            if (tailInst != null) tailInst.setNextInst(null);
            else headInst = null;
        }
    }

    public void removeThis()
    {
        for (RVBasicBlock successor : successors)
        {
            successor.removePredecessor(this);
        }
        for (RVBasicBlock predecessor : predecessors)
        {
            predecessor.removeSuccessor(this);
        }
    }

    public void addBasicBlock(RVBasicBlock basicBlock)
    {
        if (basicBlock != null)
        {
            this.addSuccessor(basicBlock);
            basicBlock.addPredecessor(this);
        }
    }

    public void mergeBasicBlock(RVBasicBlock basicBlock)
    {
        for (RVBasicBlock successor : successors)
        {
            successor.replacePredecessor(this, basicBlock);
        }
        basicBlock.removeTailInst();
        basicBlock.addInst2Tail(this.headInst);
        basicBlock.tailInst = this.tailInst;
        basicBlock.isEnded = true;
        for (RVInstruction instruction = this.headInst; instruction.hasNextInst(); instruction = instruction.getNextInst())
        {
            instruction.setCurrentBlock(basicBlock);
        }
    }


    public void accept(RVVisitor visitor)
    {
        visitor.visit(this);
    }

    //Liveness Analysis
    public Set<RVRegister> used = new HashSet<>();
    public Set<RVRegister> def = new HashSet<>();
    public Set<RVRegister> liveIn = new HashSet<>();
    public Set<RVRegister> liveOut = new HashSet<>();
}
