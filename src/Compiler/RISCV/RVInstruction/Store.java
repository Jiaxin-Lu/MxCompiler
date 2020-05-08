package Compiler.RISCV.RVInstruction;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVOperand.*;
import Compiler.RISCV.RVVisitor;

public class Store extends RVInstruction
{
    private RVRegister rd;
    private RVOperand dst;
    private RVImmediate imm;

    public Store(RVBasicBlock basicBlock, RVRegister rd, RVOperand dst)
    {
        super(basicBlock);
        this.rd = rd;
        this.dst = dst;
        calcDefUse();
    }

    public Store(RVBasicBlock basicBlock, RVRegister rd, RVOperand dst, RVImmediate imm)
    {
        super(basicBlock);
        this.rd = rd;
        this.dst = dst;
        this.imm = imm;
        calcDefUse();
    }

    public RVRegister getRd()
    {
        return rd;
    }

    public RVOperand getDst()
    {
        return dst;
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
        used.add(rd);
        if (dst instanceof RVRegister) used.add((RVRegister) dst);
    }

    @Override
    public void replaceUsed(RVRegister oldReg, RVRegister newReg)
    {
        if (rd == oldReg) rd = newReg;
        if (dst instanceof RVRegister && dst == oldReg) dst = newReg;
        calcDefUse();
    }

    @Override
    public void replaceDef(RVRegister oldReg, RVRegister newReg)
    {

    }

    @Override
    public void accept(RVVisitor visitor)
    {
        visitor.visit(this);
    }

    @Override
    public String toString()
    {
        if (dst instanceof StackData)
            return indent + "sw" + indent + indent + rd + "," + dst;
        else return indent + "sw" + indent + indent + rd + "," + imm + "(" + dst + ")";
    }
}
