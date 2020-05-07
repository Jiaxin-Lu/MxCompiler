package Compiler.RISCV.RVInstruction;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVOperand.Immediate;
import Compiler.RISCV.RVOperand.RVRegister;
import Compiler.RISCV.RVOperand.VirtualRegister;
import Compiler.RISCV.RVVisitor;

public class InstLi extends RVInstruction
{
    private RVRegister rd;
    private Immediate imm;

    public InstLi(RVBasicBlock basicBlock, RVRegister rd, Immediate imm)
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

    public Immediate getImm()
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
        calcDefUse();
    }

    @Override
    public void accept(RVVisitor visitor)
    {
        visitor.visit(this);
    }

    @Override
    public String toString()
    {
        return indent + "li" + indent + indent + rd + "," + imm;
    }
}
