package Compiler.RISCV.RVOperand;

import Compiler.RISCV.RVInstruction.Move;

import java.util.HashSet;
import java.util.Set;

public abstract class RVRegister extends RVOperand
{
    public RVRegister() {}
    public RVRegister(String name)
    {
        super(name);
    }

    @Override
    public String toString()
    {
        return color == null ? name : color.getName();
    }

    //Register Allocation
    public double spillPriority;
    public PhysicalRegister color = null;
    public StackData spillAddr = null;
    public RVRegister alias;

    public RVRegister(String name, PhysicalRegister color)
    {
        super(name);
        this.color = color;
    }

    public Set<Move> moveList = new HashSet<>();
    public Set<RVRegister> adjList = new HashSet<>();
    public int degree;
    public boolean addSpill = false;

    public void clearAllocInfo()
    {
        moveList.clear();
        adjList.clear();
        alias = null;
        spillAddr = null;
    }
}