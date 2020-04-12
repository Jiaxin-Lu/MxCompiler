package Compiler.IR.Operand;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;

import java.util.*;

public class VirtualRegister extends Register
{
    private PhysicalRegister enforcedReg = null;

    public VirtualRegister(){}
    public VirtualRegister(String name)
    {
        super(name);
    }

    public PhysicalRegister getEnforcedReg()
    {
        return enforcedReg;
    }

    public void setEnforcedReg(PhysicalRegister enforcedReg)
    {
        this.enforcedReg = enforcedReg;
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        if (SSAReg)
            visitor.visit(original);
        else
            visitor.visit(this);
    }

    // SSA
    public Set<BasicBlock> defBlocks = new HashSet<>();
    public Stack<Integer> stack = new Stack<>();
    public int counter = 0;

    private boolean SSAReg = false;

    private VirtualRegister original = null;
    private Map<Integer, VirtualRegister> renameMap = null;
    private int SSAid = -1;

    public VirtualRegister(int SSAid, VirtualRegister original)
    {
        super(original.name);
        this.SSAid = SSAid;
        this.original = original;
        this.SSAReg = true;
    }

    public int getSSAid()
    {
        return SSAid;
    }

    public VirtualRegister getOriginal()
    {
        if (original == null) return this;
        else return original;
    }

    public int SSANewID()
    {
        int newID = counter++;
        stack.push(newID);
        return newID;
    }

    public VirtualRegister getSSARegister(int id)
    {
        if (renameMap == null) renameMap = new HashMap<>();
        VirtualRegister reg = renameMap.get(id);
        if (reg == null)
        {
            reg = new VirtualRegister(id, this);
            renameMap.put(id, reg);
        }
        return reg;
    }
}
