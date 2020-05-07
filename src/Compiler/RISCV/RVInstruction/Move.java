package Compiler.RISCV.RVInstruction;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVOperand.RVRegister;
import Compiler.RISCV.RVOperand.VirtualRegister;
import Compiler.RISCV.RVVisitor;

public class Move extends RVInstruction
{
    private RVRegister rs;
    private RVRegister rd;

    public Move(RVBasicBlock basicBlock, RVRegister rs, RVRegister rd)
    {
        super(basicBlock);
        this.rs = rs;
        this.rd = rd;
        calcDefUse();
    }

    public RVRegister getRs()
    {
        return rs;
    }

    public RVRegister getRd()
    {
        return rd;
    }

    public RVRegister getDst()
    {
        return rd;
    }

    public RVRegister getSrc()
    {
        return rs;
    }

    @Override
    public void calcDefUse()
    {
        def.clear();
        used.clear();
        def.add(rd);
        used.add(rs);
    }

    @Override
    public void replaceDef(RVRegister oldReg, RVRegister newReg)
    {
        if (rd == oldReg) rd = newReg;
        calcDefUse();
    }

    @Override
    public void replaceUsed(RVRegister oldReg, RVRegister newReg)
    {
        if (rs == oldReg) rs = newReg;
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
        return indent + "mv" + indent + indent + rd + "," + rs;
    }
}
