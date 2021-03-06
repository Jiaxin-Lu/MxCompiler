package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;
import Compiler.RISCV.RVInstruction.InstB;
import Compiler.RISCV.RVInstruction.RVInstruction;

import java.util.Map;

public class BranchInst extends IRInstruction
{
    private Operand cond;
    private BasicBlock thenBlock;
    private BasicBlock elseBlock;

    //Instruction Selection
    private InstB rvInstB = null;

    public BranchInst(BasicBlock basicBlock, Operand cond, BasicBlock thenBlock, BasicBlock elseBlock)
    {
        super(basicBlock);
        this.cond = cond;
        this.thenBlock = thenBlock;
        this.elseBlock = elseBlock;
        resolveUsedRegister();
    }

    public Operand getCond()
    {
        return cond;
    }

    public BasicBlock getThenBlock()
    {
        return thenBlock;
    }

    public BasicBlock getElseBlock()
    {
        return elseBlock;
    }

    public void setCond(Operand cond)
    {
        this.cond = cond;
        resolveUsedRegister();
    }

    public void replaceTargetBlock(BasicBlock basicBlock, BasicBlock targetBlock)
    {
        if (basicBlock == this.thenBlock) this.thenBlock = targetBlock;
        if (basicBlock == this.elseBlock) this.elseBlock = targetBlock;
    }

    public void setRvInstB(InstB rvInstB)
    {
        this.rvInstB = rvInstB;
    }

    public RVInstruction getRvInstB()
    {
        return rvInstB;
    }

    @Override
    public void resolveUsedRegister()
    {
        usedRegister.clear();
        if (cond instanceof Register)
        {
            usedRegister.add((Register) cond);
            ((Register) cond).addUsedInst(this);
        }
    }

    @Override
    public void replaceUsedRegister(Operand oldOperand, Operand newOperand)
    {
        if (cond == oldOperand) cond = newOperand;
        resolveUsedRegister();
    }

    @Override
    public void setUsedRegister(Map<Register, Register> registerMap)
    {
        if (cond instanceof  Register) cond = registerMap.get(cond);
    }

    @Override
    public Register getDefRegister()
    {
        return null;
    }

    @Override
    public void setDefRegister(Register register)
    {
    }

    @Override
    public IRInstruction copyInst(Map<BasicBlock, BasicBlock> basicBlockMap, Map<Operand, Operand> registerMap)
    {
        return new BranchInst(basicBlockMap.getOrDefault(currentBlock, currentBlock),
                registerMap.getOrDefault(cond, cond),
                basicBlockMap.getOrDefault(thenBlock, thenBlock), basicBlockMap.getOrDefault(elseBlock, elseBlock));
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }

    @Override
    public void renameDstRegisterSSA()
    {

    }

    @Override
    public void renameUsedRegisterSSA()
    {
        if ((cond instanceof VirtualRegister) && (!(cond instanceof GlobalVariable)))
            cond = ((VirtualRegister) cond).getSSARegister(((VirtualRegister) cond).stack.peek());
        resolveUsedRegister();
    }

//    @Override
//    public void calcDefUse()
//    {
//        used.clear();
//        def.clear();
//        if ((cond instanceof VirtualRegister) && (!(cond instanceof GlobalVariable))) used.add((VirtualRegister) cond);
//    }
//
//    @Override
//    public void replaceUsed(VirtualRegister oldReg, VirtualRegister newReg)
//    {
//        if (cond == oldReg) cond = newReg;
//    }
//
//    @Override
//    public void replaceDef(VirtualRegister oldReg, VirtualRegister newReg)
//    {
//
//    }
}
