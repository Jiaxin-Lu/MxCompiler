package Compiler.RISCV.RVInstruction;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVOperand.RVRegister;
import Compiler.RISCV.RVOperand.RVStaticStr;
import Compiler.RISCV.RVVisitor;

public class InstLa extends RVInstruction
{
    private RVRegister rd;
    private RVStaticStr str;

    public InstLa(RVBasicBlock basicBlock, RVRegister rd, RVStaticStr str)
    {
        super(basicBlock);
        this.rd = rd;
        this.str = str;
        calcDefUse();
    }

    public RVRegister getRd()
    {
        return rd;
    }

    public RVStaticStr getStr()
    {
        return str;
    }

    @Override
    public void calcDefUse()
    {
        used.clear();
        def.clear();
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
    public String toString()
    {
        return indent + "la" + indent + indent + rd + ", " + str.getName();
    }

    @Override
    public void accept(RVVisitor visitor)
    {
        visitor.visit(this);
    }
}
