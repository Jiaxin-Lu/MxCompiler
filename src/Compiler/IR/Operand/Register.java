package Compiler.IR.Operand;

import Compiler.IR.IRInstruction.IRInstruction;
import Compiler.RISCV.RVOperand.RVRegister;
import Compiler.RISCV.RVOperand.RVStaticStr;

import java.util.HashSet;
import java.util.Set;

public abstract class Register extends Operand
{
    public Register() {}
    public Register(String name)
    {
        super(name);
    }

    public RVRegister rvRegister = null;

    public RVStaticStr rvStaticStr = null;

    public boolean isStrBase = false;

    //Instruction Selection
    Set<IRInstruction> usedInst = new HashSet<>();
    public void addUsedInst(IRInstruction inst)
    {
        usedInst.add(inst);
    }

    public Set<IRInstruction> getUsedInst()
    {
        return usedInst;
    }
}
