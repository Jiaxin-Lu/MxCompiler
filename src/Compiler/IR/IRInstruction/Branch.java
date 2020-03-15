package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;

import java.util.Map;

public class Branch extends IRInstruction
{
    private Operand cond;
    private BasicBlock thenBlock;
    private BasicBlock elseBlock;

    public Branch(BasicBlock basicBlock, Operand cond, BasicBlock thenBlock, BasicBlock elseBlock)
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

    @Override
    public void resolveUsedRegister()
    {
        usedRegister.clear();
        if (cond instanceof Register) usedRegister.add((Register) cond);
    }

    @Override
    public void setUsedRegister(Map<Register, Register> registerMap)
    {
        if (cond instanceof  Register) cond = registerMap.get(cond);
    }

    @Override
    public Register getOriginRegister()
    {
        return null;
    }

    @Override
    public void setOriginRegister(Register register)
    {
    }

    @Override
    public IRInstruction copyInst(Map<BasicBlock, BasicBlock> basicBlockMap, Map<Operand, Operand> registerMap)
    {
        return new Branch(basicBlockMap.getOrDefault(currentBlock, currentBlock),
                registerMap.getOrDefault(cond, cond),
                basicBlockMap.getOrDefault(thenBlock, thenBlock), basicBlockMap.getOrDefault(elseBlock, elseBlock));
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
