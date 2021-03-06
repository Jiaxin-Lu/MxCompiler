package Compiler.RISCV.RVInstruction;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVOperand.*;
import Compiler.RISCV.RVVisitor;

public class Load extends RVInstruction
{
    private RVRegister rd;
    private RVOperand src;
    private RVImmediate imm;

    public Load(RVBasicBlock basicBlock, RVRegister rd, RVRegister src, RVImmediate imm)
    {
        super(basicBlock);
        this.rd = rd;
        this.src = src;
        this.imm = imm;
        calcDefUse();
    }

    public Load(RVBasicBlock basicBlock, RVRegister rd, StackData src)
    {
        super(basicBlock);
        this.rd = rd;
        this.src = src;
    }

    public RVRegister getRd()
    {
        return rd;
    }

    public RVOperand getSrc()
    {
        return src;
    }

    public StackData getStackSrc()
    {
        if (src instanceof StackData) return (StackData) src;
        else return null;
    }

    public RVImmediate getImm()
    {
        return imm;
    }

    @Override
    public void calcDefUse()
    {
        def.clear();
        used.clear();
        if (src instanceof RVRegister && !((RVRegister) src).isGlobal) used.add((RVRegister) src);
        def.add(rd);
    }

    @Override
    public void replaceDef(RVRegister oldReg, RVRegister newReg)
    {
        if (rd == oldReg) rd = newReg;
    }

    @Override
    public void replaceUsed(RVRegister oldReg, RVRegister newReg)
    {
        if (src instanceof RVRegister && src == oldReg) src = newReg;
    }

    @Override
    public String toString()
    {
        if (src instanceof StackData)
            return indent + "lw" + indent + indent + rd + ", " + src;
        else return indent + "lw" + indent + indent + rd + ", " + imm + "(" + src + ")";
    }

    @Override
    public void accept(RVVisitor visitor)
    {
        visitor.visit(this);
    }
}
