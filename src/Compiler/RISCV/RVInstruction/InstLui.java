package Compiler.RISCV.RVInstruction;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVOperand.RVImmediate;
import Compiler.RISCV.RVOperand.RVRegister;
import Compiler.RISCV.RVVisitor;

public class InstLui extends RVInstruction
{
    private RVRegister rd;
    private RVImmediate imm;

    public InstLui(RVBasicBlock basicBlock, RVRegister rd, RVImmediate imm)
    {
        super(basicBlock);
        this.rd = rd;
        this.imm = imm;
        calcDefUse();
    }

    public RVRegister getRd()
    {
        return rd;
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
        def.add(rd);
    }

    @Override
    public void replaceUsed(RVRegister oldReg, RVRegister newReg)
    {

    }

    @Override
    public void replaceDef(RVRegister oldReg, RVRegister newReg)
    {
        if (rd == oldReg) rd = newReg;
    }

    @Override
    public void accept(RVVisitor visitor)
    {
        visitor.visit(this);
    }

    @Override
    public String toString()
    {
        return indent + "lui" + indent + indent + rd + "," + imm;
    }
}
