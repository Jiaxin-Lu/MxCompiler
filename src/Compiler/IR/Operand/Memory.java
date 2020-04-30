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

    public Register getBase()
    {
        return base;
    }

    //Stack Data
    private Register index;
    private Immediate scale = new Immediate(0);
    private Immediate offset = new Immediate(0);

    public Memory(VirtualRegister base, Register index, Immediate scale, Immediate offset)
    {
        super(base.getName());
        this.base = base;
        this.index = index;
        this.scale = scale;
        this.offset = offset;
    }

    public Register getIndex()
    {
        return index;
    }

    public Immediate getScale()
    {
        return scale;
    }

    public Immediate getOffset()
    {
        return offset;
    }


    public List<VirtualRegister> getUsedRegister()
    {
        usedRegister.clear();
        if (base != null && !(base instanceof GlobalVariable)) usedRegister.add((VirtualRegister) base);
        if (index != null && !(index instanceof GlobalVariable)) usedRegister.add((VirtualRegister) index);
        return usedRegister;
    }

    public void replaceOperand(Operand oldOperand, Operand newOperand)
    {
        if (base == oldOperand) base = (VirtualRegister) newOperand;
        if (index == oldOperand) index = (VirtualRegister) newOperand;
    }
    //TODO : everything concerning StackData!
}
