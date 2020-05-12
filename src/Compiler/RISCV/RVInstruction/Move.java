package Compiler.RISCV.RVInstruction;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVOperand.RVRegister;
import Compiler.RISCV.RVVisitor;

public class Move extends RVInstruction
{
    private RVRegister rd;
    private RVRegister rs;

    //rd = rs

    public Move(RVBasicBlock basicBlock, RVRegister rd, RVRegister rs)
    {
        super(basicBlock);
        this.rd = rd;
        this.rs = rs;
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
    }

    @Override
    public void replaceUsed(RVRegister oldReg, RVRegister newReg)
    {
        if (rs == oldReg) rs = newReg;
    }

    @Override
    public void accept(RVVisitor visitor)
    {
        visitor.visit(this);
    }

    @Override
    public String toString()
    {
        return indent + "mv" + indent + indent + rd + ", " + rs;
    }
}
