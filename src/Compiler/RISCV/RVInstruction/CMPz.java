package Compiler.RISCV.RVInstruction;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVOperand.RVRegister;
import Compiler.RISCV.RVVisitor;

public class CMPz extends RVInstruction
{
    public enum Op
    {
        seqz("seqz"), snez("snez"), sltz("sltz"), sgtz("sgtz");

        private String str;
        private Op(String str)
        {
            this.str = str;
        }

        @Override
        public String toString()
        {
            return str;
        }
    }

    private Op op;
    private RVRegister rs;
    private RVRegister rd;

    public CMPz(RVBasicBlock basicBlock, Op op, RVRegister rd, RVRegister rs)
    {
        super(basicBlock);
        this.op = op;
        this.rs = rs;
        this.rd = rd;
        calcDefUse();
    }

    public Op getOp()
    {
        return op;
    }

    public RVRegister getRs()
    {
        return rs;
    }

    public RVRegister getRd()
    {
        return rd;
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
    public void replaceUsed(RVRegister oldReg, RVRegister newReg)
    {
        if (rs == oldReg) rs = newReg;
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
        return indent + op + indent + rd + "," + rs;
    }
}
