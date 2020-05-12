package Compiler.RISCV.RVInstruction;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVOperand.RVImmediate;
import Compiler.RISCV.RVOperand.RVRegister;
import Compiler.RISCV.RVVisitor;

public class InstI extends RVInstruction
{
    public enum Op
    {
        addi("addi"), andi("andi"), ori("ori"), xori("xori"),
        slli("slli"), slti("slti"), sltiu("sltiu"), srai("srai");
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
    private RVRegister rd;
    private RVRegister rs;
    private RVImmediate imm;

    public InstI(RVBasicBlock basicBlock, Op op, RVRegister rd, RVRegister rs, RVImmediate imm)
    {
        super(basicBlock);
        this.op = op;
        this.rd = rd;
        this.rs = rs;
        this.imm = imm;
        calcDefUse();
    }

    public Op getOp()
    {
        return op;
    }

    public RVRegister getRd()
    {
        return rd;
    }

    public RVRegister getRs()
    {
        return rs;
    }

    public RVImmediate getImm()
    {
        return imm;
    }

    @Override
    public void calcDefUse()
    {
        used.clear();
        def.clear();
        used.add(rs);
        def.add(rd);
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
        return indent + op + indent + rd + ", " + rs + ", " + imm;
    }
}
