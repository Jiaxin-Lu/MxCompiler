package Compiler.IR.IRInstruction;

import Compiler.IR.*;
import Compiler.IR.Operand.*;

import java.util.*;

public abstract class IRInstruction
{
    protected BasicBlock currentBlock;
    private IRInstruction prevInst;
    private IRInstruction nextInst;
    protected List<Register> usedRegister = new ArrayList<>();

    public IRInstruction(BasicBlock basicBlock)
    {
        this.currentBlock = basicBlock;
    }

    public BasicBlock getCurrentBlock()
    {
        return currentBlock;
    }

    public void setCurrentBlock(BasicBlock currentBlock)
    {
        this.currentBlock = currentBlock;
    }

    public IRInstruction getPrevInst()
    {
        return prevInst;
    }

    public void setPrevInst(IRInstruction prevInst)
    {
        this.prevInst = prevInst;
    }

    public boolean hasPrevInst()
    {
        return  this.prevInst != null;
    }

    public IRInstruction getNextInst()
    {
        return nextInst;
    }

    public void setUsedRegister(List<Register> usedRegister)
    {
        this.usedRegister = usedRegister;
    }

    public void setNextInst(IRInstruction nextInst)
    {
        this.nextInst = nextInst;
    }

    public boolean hasNextInst()
    {
        return  this.nextInst != null;
    }

    public void replaceInst(IRInstruction instruction)
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

    public void addPrevInst(IRInstruction instruction)
    {
        if (hasPrevInst())
            this.prevInst.setNextInst(instruction);
        else currentBlock.headInst = instruction;
        instruction.setNextInst(this);
        instruction.setPrevInst(this.prevInst);
        this.prevInst = instruction;
    }

    public void addNextInst(IRInstruction instruction)
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

    public abstract void accept(IRVisitor visitor);

    public abstract void resolveUsedRegister();

    public abstract void setUsedRegister(Map<Register, Register> registerMap);

    public List<Register> getUsedRegister()
    {
        resolveUsedRegister();
        return usedRegister;
    }

    public abstract Register getDefRegister();

    public abstract void setDefRegister(Register register);

    public abstract IRInstruction copyInst(Map<BasicBlock, BasicBlock> basicBlockMap, Map<Operand, Operand> registerMap);

    public abstract void renameUsedRegisterSSA();

    public abstract void renameDstRegisterSSA();

    public abstract void replaceUsedRegister(Operand oldOperand, Operand newOperand);

    //Liveness Analysis
    public Set<VirtualRegister> used = new HashSet<>();
    public Set<VirtualRegister> def = new HashSet<>();
    public Set<VirtualRegister> liveIn = new HashSet<>();
    public Set<VirtualRegister> liveOut = new HashSet<>();

    public abstract void calcDefUse();

    public abstract void replaceUsed(VirtualRegister oldReg, VirtualRegister newReg);
    public abstract void replaceDef(VirtualRegister oldReg, VirtualRegister newReg);

    //TODO : A lot more!

}
