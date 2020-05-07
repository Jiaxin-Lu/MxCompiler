package Compiler.RISCV.RVOperand;

public class StackData extends RVOperand
{
    private int index;
    public StackData()
    {
        this.index = 0;
    }

    public void setIndex(int index)
    {
        this.index = index;
    }

    public void addIndex(int index)
    {
        this.index += index;
    }

    public int getIndex()
    {
        return index;
    }

    @Override
    public String toString()
    {
        return String.valueOf(index) + "(sp)";
    }
}
