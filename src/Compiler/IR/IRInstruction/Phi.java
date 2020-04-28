package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;

import java.util.LinkedHashMap;
import java.util.Map;

public class Phi extends IRInstruction
{
    private Operand dst;
    private Map<BasicBlock, Operand> path = new LinkedHashMap<>();
    public Phi(BasicBlock basicBlock, Operand dst)
    {
        super(basicBlock);
        this.dst = dst;
        resolveUsedRegister();
    }

    public Operand getDst()
    {
        return dst;
    }

    public void setDst(Operand dst)
    {
        this.dst = dst;
    }

    public Map<BasicBlock, Operand> getPath()
    {
        return path;
    }

    public void addPath(BasicBlock basicBlock, Operand dst)
    {
        path.put(basicBlock, dst);
    }

    public void removePath(BasicBlock basicBlock)
    {
        path.remove(basicBlock);
        if (path.size() == 1)
        {
            IRInstruction instruction = new Move(currentBlock, path.values().iterator().next(), dst);
            replaceInst(instruction);
            if (this == currentBlock.headInst) currentBlock.headInst = instruction;
            if (this == currentBlock.tailInst) currentBlock.tailInst = instruction;
        }
    }

    public void eliminateSinglePath()
    {
        IRInstruction instruction = new Move(currentBlock, path.values().iterator().next(), dst);
        replaceInst(instruction);
        if (this == currentBlock.headInst) currentBlock.headInst = instruction;
        if (this == currentBlock.tailInst) currentBlock.tailInst = instruction;
    }

    public void replacePath(BasicBlock oldBlock, BasicBlock newBlock)
    {
        Operand operand = path.get(oldBlock);
        path.remove(oldBlock);
        path.put(newBlock, operand);
    }

    @Override
    public Register getDefRegister()
    {
        return (Register) dst;
    }

    @Override
    public void setDefRegister(Register register)
    {
    }

    @Override
    public void resolveUsedRegister()
    {
        usedRegister.clear();
        for (Map.Entry<BasicBlock, Operand> entry : path.entrySet())
        {
            Operand operand = entry.getValue();
            if (operand instanceof Register) usedRegister.add((Register) operand);
        }
    }

    @Override
    public void replaceUsedRegister(Operand oldOperand, Operand newOperand)
    {
        for (Map.Entry<BasicBlock, Operand> entry : path.entrySet())
        {
            BasicBlock basicBlock = entry.getKey();
            Operand operand = entry.getValue();
            if (operand == oldOperand) path.put(basicBlock, newOperand);
        }
        resolveUsedRegister();
    }

    @Override
    public void setUsedRegister(Map<Register, Register> registerMap)
    {
    }

    @Override
    public IRInstruction copyInst(Map<BasicBlock, BasicBlock> basicBlockMap, Map<Operand, Operand> registerMap)
    {
        return null;
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }

    @Override
    public void renameUsedRegisterSSA()
    {

    }

    @Override
    public void renameDstRegisterSSA()
    {

    }
}
