package Compiler.RISCV.RVInstruction;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVOperand.RVRegister;
import Compiler.RISCV.RVOperand.VirtualRegister;
import Compiler.RISCV.RVVisitor;

public class InstJ extends RVInstruction
{
    RVBasicBlock dst;

    public InstJ(RVBasicBlock basicBlock, RVBasicBlock dst)
    {
        super(basicBlock);
        this.dst = dst;
    }

    public RVBasicBlock getDst()
    {
        return dst;
    }

    @Override
    public void calcDefUse()
    {

    }

    @Override
    public void replaceDef(RVRegister oldReg, RVRegister newReg)
    {

    }

    @Override
    public void replaceUsed(RVRegister oldReg, RVRegister newReg)
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
        return indent + "j" + indent + indent + dst.getName();
    }
}
