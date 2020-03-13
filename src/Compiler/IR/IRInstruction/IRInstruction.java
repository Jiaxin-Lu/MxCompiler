package Compiler.IR.IRInstruction;

import Compiler.IR.*;
import Compiler.IR.Operand.*;

import java.util.ArrayList;
import java.util.List;

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

    public void setNextInst(IRInstruction nextInst)
    {
        this.nextInst = nextInst;
    }

    public boolean hasNextInst()
    {
        return  this.nextInst != null;
    }

    public void setUsedRegister(List<Register> usedRegister)
    {
        this.usedRegister = usedRegister;
    }

    public List<Register> getUsedRegister()
    {
        return usedRegister;
    }

    public abstract void accept(IRVisitor irVisitor);
    //TODO : replace, prepend, postpend, removeThis,

}
