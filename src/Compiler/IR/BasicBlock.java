package Compiler.IR;

import Compiler.IR.IRInstruction.*;
import Compiler.IR.Operand.*;
import Compiler.Type.BaseScope;

import java.util.HashSet;
import java.util.Set;

public class BasicBlock
{
    private IRInstruction headInst;
    private IRInstruction tailInst;

    private Function function;
    private String name;
    private Set<BasicBlock> predecessors = new HashSet<>();
    private Set<BasicBlock> successors = new HashSet<>();

    public BasicBlock IDOM;
    public BasicBlock postIDOM;
    public int dfn;
    public BasicBlock dfsFatherBlock;
    public Set<BasicBlock> DF;
    //TODO : ARE THERE ANYTHING MORE?

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

    //TODO : removeInst

    public void removeThis()
    {
        for (BasicBlock successor : successors)
        {
            for (IRInstruction instruction = successor.headInst; instruction.hasNextInst() ; instruction = instruction.getNextInst())
            {
                //TODO : removeThis !
            }
        }
    }

    //TODO: mergeBlock

    //TODO : A lot more!
    //      I'M MOVING TO IR INSTRUCTION!
}
