package Compiler.IR;

import Compiler.IR.IRInstruction.*;

import java.util.HashSet;
import java.util.Set;

public class BasicBlock
{
    public IRInstruction headInst;
    public IRInstruction tailInst;

    private Function function;
    private String name;
    private Set<BasicBlock> predecessors = new HashSet<>();
    private Set<BasicBlock> successors = new HashSet<>();

    public BasicBlock IDOM;
    public BasicBlock postIDOM;
    public int preOrderIndex;
    public int postOrderIndex;
    public BasicBlock dfsFatherBlock;
    public Set<BasicBlock> DF;

    private boolean isEnded = false;

    public BasicBlock(Function function, String name)
    {
        this.function = function;
        this.name = name;
    }

    public String getName()
    {
        return function.getName() + "." + name;
    }

    public Set<BasicBlock> getSuccessors()
    {
        return successors;
    }

    public Set<BasicBlock> getPredecessors()
    {
        return predecessors;
    }

    public Function getFunction()
    {
        return function;
    }

    public boolean isEnded()
    {
        return isEnded;
    }

    public void addSuccessor(BasicBlock basicBlock)
    {
        successors.add(basicBlock);
    }

    public void addPredecessor(BasicBlock basicBlock)
    {
        predecessors.add(basicBlock);
    }

    public void removeSuccessor(BasicBlock basicBlock)
    {
        if (basicBlock == null) return;
        successors.remove(basicBlock);
    }
    public void removePredecessor(BasicBlock basicBlock)
    {
        if (basicBlock == null) return;
        predecessors.remove(basicBlock);
    }
    public void replacePredecessor(BasicBlock oldBlock, BasicBlock newBlock)
    {
        if (oldBlock != null) predecessors.remove(oldBlock);
        predecessors.add(newBlock);
        newBlock.successors.add(this);
    }

    public void addInst2Head(IRInstruction instruction)
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

    public void addInst2Tail(IRInstruction instruction)
    {
        if (tailInst == null)
            headInst = tailInst = instruction;
        else
        {
            instruction.setPrevInst(tailInst);
            tailInst.setNextInst(instruction);
            tailInst = instruction;
        }
    }

    public void removeTailInst()
    {
        isEnded = false;
        if (tailInst == null)
        {

        } else
        {
            if (tailInst instanceof Branch)
            {
                removeSuccessor(((Branch) tailInst).getThenBlock());
                removeSuccessor(((Branch) tailInst).getElseBlock());
            } else if (tailInst instanceof Jump)
            {
                removeSuccessor(((Jump) tailInst).getDstBlock());
            } else if (tailInst instanceof Return)
            {
                function.getReturnList().remove(tailInst);
            }
            tailInst = tailInst.getPrevInst();
            if (tailInst != null) tailInst.setNextInst(null);
            else headInst = tailInst = null;
        }
    }

    public void endThis(IRInstruction instruction)
    {
        addInst2Tail(instruction);
        if (instruction instanceof Branch)
        {
            addBasicBlock(((Branch) instruction).getThenBlock());
            addBasicBlock(((Branch) instruction).getElseBlock());
        } else if (instruction instanceof Jump)
        {
            addBasicBlock(((Jump) instruction).getDstBlock());
        } else if (instruction instanceof Return)
        {
            function.addReturnList((Return) instruction);
        }
        isEnded = true;
    }

    public void removeThis()
    {
        for (BasicBlock successor : successors)
        {
            for (IRInstruction instruction = successor.headInst; instruction.hasNextInst() ; instruction = instruction.getNextInst())
            {
                if (instruction instanceof Phi) ((Phi) instruction).removePath(this);
                else break;
            }
        }
        for (BasicBlock successor : successors)
        {
            successor.removePredecessor(this);
        }
        for (BasicBlock predecessor : predecessors)
        {
            predecessor.removeSuccessor(this);
        }
    }

    public void addBasicBlock(BasicBlock basicBlock)
    {
        if (basicBlock != null)
        {
            this.addSuccessor(basicBlock);
            basicBlock.addPredecessor(this);
        }
    }

    public void mergeBasicBlock(BasicBlock basicBlock)
    {
        for (BasicBlock successor : successors)
        {
            for (IRInstruction instruction = successor.headInst; instruction.hasNextInst() ; instruction = instruction.getNextInst())
            {
                if (instruction instanceof Phi) ((Phi) instruction).replacePath(this, basicBlock);
                else break;
            }
        }
        for (BasicBlock successor : successors)
        {
            successor.replacePredecessor(this, basicBlock);
        }
        basicBlock.removeTailInst();
        basicBlock.addInst2Tail(this.headInst);
        basicBlock.tailInst = this.tailInst;
        basicBlock.isEnded = true;
        for (IRInstruction instruction = this.headInst; instruction.hasNextInst(); instruction = instruction.getNextInst())
        {
            instruction.setCurrentBlock(basicBlock);
        }
    }

    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }

    //TODO : A lot more!
}
