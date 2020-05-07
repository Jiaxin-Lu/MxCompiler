package Compiler.RISCV.RVInstruction;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVOperand.Immediate;
import Compiler.RISCV.RVOperand.RVRegister;
import Compiler.RISCV.RVOperand.VirtualRegister;
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
    private Immediate imm;

    public InstI(RVBasicBlock basicBlock, Op op, RVRegister rd, RVRegister rs, Immediate imm)
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

    public Immediate getImm()
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
        calcDefUse();
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
        return indent + op + indent + rd + "," + rs + "," + imm;
    }
}