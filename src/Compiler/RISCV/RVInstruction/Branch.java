package Compiler.RISCV.RVInstruction;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVOperand.RVRegister;
import Compiler.RISCV.RVOperand.VirtualRegister;
import Compiler.RISCV.RVVisitor;

public class Branch extends RVInstruction
{
    public enum Op
    {
        beq("beq"), bne("bne"), blt("blt"), ble("ble"), bge("bge"), bgt("bgt");

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
    private RVRegister rt;
    private RVBasicBlock dst;

    public Branch(RVBasicBlock basicBlock, Op op, RVRegister rs, RVRegister rt, RVBasicBlock dst)
    {
        super(basicBlock);
        this.op = op;
        this.rs = rs;
        this.rt = rt;
        this.dst = dst;
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

    public RVRegister getRt()
    {
        return rt;
    }

    public RVBasicBlock getDst()
    {
        return dst;
    }

    @Override
    public void calcDefUse()
    {
        used.clear();
        def.clear();
        used.add(rs);
        used.add(rt);
    }

    @Override
    public void replaceDef(RVRegister oldReg, RVRegister newReg)
    {

    }

    @Override
    public void replaceUsed(RVRegister oldReg, RVRegister newReg)
    {
        if (rs == oldReg) rs = newReg;
        if (rt == oldReg) rt = newReg;
        calcDefUse();
    }

    @Override
    public String toString()
    {
        return indent + op + indent + indent + rs + "," + rt + "," + dst.getName();
    }

    @Override
    public void accept(RVVisitor visitor)
    {
        visitor.visit(this);
    }
}
