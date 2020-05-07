package Compiler.RISCV.RVInstruction;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVOperand.RVOperand;
import Compiler.RISCV.RVOperand.RVRegister;
import Compiler.RISCV.RVVisitor;

import java.util.*;

public abstract class RVInstruction
{
    protected RVBasicBlock currentBlock;
    private RVInstruction prevInst;
    private RVInstruction nextInst;
    protected List<RVRegister> usedRegister = new ArrayList<>();

    public RVInstruction(RVBasicBlock basicBlock)
    {
        this.currentBlock = basicBlock;
    }

    public RVBasicBlock getCurrentBlock()
    {
        return currentBlock;
    }

    public void setCurrentBlock(RVBasicBlock currentBlock)
    {
        this.currentBlock = currentBlock;
    }

    public RVInstruction getPrevInst()
    {
        return prevInst;
    }

    public void setPrevInst(RVInstruction prevInst)
    {
        this.prevInst = prevInst;
    }

    public boolean hasPrevInst()
    {
        return  this.prevInst != null;
    }

    public RVInstruction getNextInst()
    {
        return nextInst;
    }

    public void setUsedRegister(List<RVRegister> usedRegister)
    {
        this.usedRegister = usedRegister;
    }

    public void setNextInst(RVInstruction nextInst)
    {
        this.nextInst = nextInst;
    }

    public boolean hasNextInst()
    {
        return  this.nextInst != null;
    }

    public void replaceInst(RVInstruction instruction)
    {
        if (hasPrevInst())
        {
            this.prevInst.setNextInst(instruction);
            instruction.setPrevInst(this.prevInst);
        } else currentBlock.headInst = instruction;
        if (hasNextInst())
        {
            this.nextInst.setPrevInst(instruction);
            instruction.setNextInst(this.nextInst);
        } else currentBlock.tailInst = instruction;
    }

    public void addPrevInst(RVInstruction instruction)
    {
        if (hasPrevInst())
            this.prevInst.setNextInst(instruction);
        else currentBlock.headInst = instruction;
        instruction.setNextInst(this);
        instruction.setPrevInst(this.prevInst);
        this.prevInst = instruction;
    }

    public void addNextInst(RVInstruction instruction)
    {
        if (hasNextInst())
            this.nextInst.setPrevInst(instruction);
        else currentBlock.tailInst = instruction;
        instruction.setPrevInst(this);
        instruction.setNextInst(this.nextInst);
        this.nextInst = instruction;
    }

    public void removeThis()
    {
        if (hasPrevInst()) this.prevInst.setNextInst(this.nextInst);
        else currentBlock.headInst = this.nextInst;
        if (hasNextInst()) this.nextInst.setPrevInst(this.prevInst);
        else currentBlock.tailInst = this.prevInst;
    }

    public abstract void accept(RVVisitor visitor);

    //Liveness Analysis
    public Set<RVRegister> used = new HashSet<>();
    public Set<RVRegister> def = new HashSet<>();
    public Set<RVRegister> liveIn = new HashSet<>();
    public Set<RVRegister> liveOut = new HashSet<>();

    public abstract void calcDefUse();

    public abstract void replaceUsed(RVRegister oldReg, RVRegister newReg);
    public abstract void replaceDef(RVRegister oldReg, RVRegister newReg);

    //print
    public String indent = "\t";
}
