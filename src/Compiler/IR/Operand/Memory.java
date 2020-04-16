package Compiler.IR.Operand;

import java.util.ArrayList;
import java.util.List;

public abstract class Memory extends Operand
{
    private Register base = null;
    private List<VirtualRegister> usedRegister = new ArrayList<>();

    public Memory(VirtualRegister base)
    {
        super(base.getName());
        this.base = base;
    }

    public List<VirtualRegister> getUsedRegister()
    {
        usedRegister.clear();
        if (base != null && !(base instanceof GlobalVariable)) usedRegister.add((VirtualRegister) base);
        return usedRegister;
    }

    public Register getBase()
    {
        return base;
    }

    public void replaceOperand(Operand oldOperand, Operand newOperand)
    {
        if (base == oldOperand) base = (VirtualRegister) newOperand;
    }

    //TODO : everything concerning StackData!
}
