package Compiler.IR;

import Compiler.IR.IRInstruction.*;
import Compiler.IR.Operand.VirtualRegister;
import Compiler.RISCV.RVBasicBlock;

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

    public int preOrderIndex;
    public int postOrderIndex;
    public BasicBlock dfsFatherBlock;
    public BasicBlock IDOM;
    public Set<BasicBlock> DominanceFrontier;
    public Set<BasicBlock> DominatorTreeSuccessor;
    public Set<BasicBlock> DominatorTreeSuccessorsAll;

    public int reverseCFGPostOrderIndex;
    public BasicBlock postIDOM;
    public Set<BasicBlock> PostDominatorTreeSuccessor;
    public Set<BasicBlock> PostDominanceFrontier;

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
        if (!(tailInst == null))
        {
            if (tailInst instanceof BranchInst)
            {
                removeSuccessor(((BranchInst) tailInst).getThenBlock());
                removeSuccessor(((BranchInst) tailInst).getElseBlock());
            } else if (tailInst instanceof JumpInst)
            {
                removeSuccessor(((JumpInst) tailInst).getDstBlock());
            } else if (tailInst instanceof ReturnInst)
            {
                function.getReturnList().remove((ReturnInst)tailInst);
            }
            tailInst = tailInst.getPrevInst();
            if (tailInst != null) tailInst.setNextInst(null);
            else headInst = null;
        }
    }

    public void endThis(IRInstruction instruction)
    {
        if (isEnded) return;
        addInst2Tail(instruction);
        if (instruction instanceof BranchInst)
        {
            addBasicBlock(((BranchInst) instruction).getThenBlock());
            addBasicBlock(((BranchInst) instruction).getElseBlock());
        } else if (instruction instanceof JumpInst)
        {
            addBasicBlock(((JumpInst) instruction).getDstBlock());
        } else if (instruction instanceof ReturnInst)
        {
            function.addReturnList((ReturnInst) instruction);
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

    public void removePhiUnusedBlock(BasicBlock basicBlock)
    {
        for (IRInstruction instruction = headInst; instruction instanceof Phi; instruction = instruction.getNextInst())
            ((Phi) instruction).removePath(basicBlock);
    }

    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }

    //Liveness Analysis
    public Set<VirtualRegister> used = new HashSet<>();
    public Set<VirtualRegister> def = new HashSet<>();
    public Set<VirtualRegister> liveIn = new HashSet<>();
    public Set<VirtualRegister> liveOut = new HashSet<>();

    public RVBasicBlock rvBasicBlock;

    //TODO : A lot more!
}
