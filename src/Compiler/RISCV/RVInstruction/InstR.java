package Compiler.RISCV.RVInstruction;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVOperand.RVRegister;
import Compiler.RISCV.RVVisitor;

public class InstR extends RVInstruction
{
    public enum Op
    {
        add("add"), sub("sub"), mul("mul"), div("div"), rem("rem"),
        and("and"), or("or"), xor("xor"),
        sll("sll"), slt("slt"), sra("sra"), sltu("sltu");

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
    private RVRegister rs1, rs2;

    public InstR(RVBasicBlock basicBlock, Op op, RVRegister rd, RVRegister rs1, RVRegister rs2)
    {
        super(basicBlock);
        this.op = op;
        this.rd = rd;
        this.rs1 = rs1;
        this.rs2 = rs2;
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

    public RVRegister getRs1()
    {
        return rs1;
    }

    public RVRegister getRs2()
    {
        return rs2;
    }

    @Override
    public void calcDefUse()
    {
        def.clear();
        used.clear();
        def.add(rd);
        used.add(rs1);
        used.add(rs2);
    }

    @Override
    public void replaceDef(RVRegister oldReg, RVRegister newReg)
    {
        if (rd == oldReg) rd = newReg;
    }

    @Override
    public void replaceUsed(RVRegister oldReg, RVRegister newReg)
    {
        if (rs1 == oldReg) rs1 = newReg;
        if (rs2 == oldReg) rs2 = newReg;
    }

    @Override
    public void accept(RVVisitor visitor)
    {
        visitor.visit(this);
    }

    @Override
    public String toString()
    {
        if (op == Op.sltu)
            return indent + op + indent + rd + "," + rs1 + "," + rs2;
        else return indent + op + indent + indent + rd + "," + rs1 + "," + rs2;
    }
}
