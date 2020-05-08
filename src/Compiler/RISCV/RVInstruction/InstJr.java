package Compiler.RISCV.RVInstruction;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVOperand.RVRegister;
import Compiler.RISCV.RVVisitor;

public class InstJr extends RVInstruction
{
    private RVRegister rs;

    public InstJr(RVBasicBlock basicBlock, RVRegister rs)
    {
        super(basicBlock);
        this.rs = rs;
        calcDefUse();
    }

    public RVRegister getRs()
    {
        return rs;
    }

    @Override
    public void calcDefUse()
    {
        def.clear();
        used.clear();
        used.add(rs);
    }

    @Override
    public void replaceUsed(RVRegister oldReg, RVRegister newReg)
    {
        if (rs == oldReg) rs = newReg;
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
        return indent + "jr" + indent + indent + rs;
    }
}
