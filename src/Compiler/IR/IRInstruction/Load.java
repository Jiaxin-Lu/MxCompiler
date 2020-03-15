package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Memory;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;

import java.util.Map;

public class Load extends IRInstruction
{
    private Operand src;
    private Operand dst;
    private boolean isGlobal;

    public Load(BasicBlock basicBlock, Operand src, Operand dst)
    {
        super(basicBlock);
        this.src = src;
        this.dst = dst;
        this.isGlobal = false;
        resolveUsedRegister();
    }
    public Load(BasicBlock basicBlock, Operand src, Operand dst, boolean isGlobal)
    {
        super(basicBlock);
        this.src = src;
        this.dst = dst;
        this.isGlobal = isGlobal;
        resolveUsedRegister();
    }

    public Operand getSrc()
    {
        return src;
    }

    public Operand getDst()
    {
        return dst;
    }

    public boolean isGlobal()
    {
        return isGlobal;
    }

    @Override
    public Register getOriginRegister()
    {
        return (Register) dst;
    }

    @Override
    public void setOriginRegister(Register register)
    {
        dst = register;
    }

    @Override
    public void resolveUsedRegister()
    {
        usedRegister.clear();
        if (src instanceof Register) usedRegister.add((Register) src);
        else if (src instanceof Memory) usedRegister.addAll(((Memory)src).getUsedRegister());
    }

    @Override
    public void setUsedRegister(Map<Register, Register> registerMap)
    {
        if (src instanceof Register) src = registerMap.get(src);
        resolveUsedRegister();
    }

    @Override
    public IRInstruction copyInst(Map<BasicBlock, BasicBlock> basicBlockMap, Map<Operand, Operand> registerMap)
    {
        return new Load(basicBlockMap.getOrDefault(currentBlock, currentBlock),
                registerMap.getOrDefault(src, src), registerMap.getOrDefault(dst, dst));
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
