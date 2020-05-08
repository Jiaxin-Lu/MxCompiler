package Compiler.RISCV.RVOperand;

public class StackData extends RVOperand
{
    private int index;
    private int type;

    public StackData()
    {
        this.index = 0;
        this.type = 1;
    }

    public StackData(int index, int type)
    {
        this.index = index;
        this.type = type;
    }

    public StackData(int index)
    {
        this.index = index;
        this.type = 0;
    }

    public void setIndex(int index)
    {
        this.index = index;
    }

    public void addIndex(int index)
    {
        this.index += index;
        this.type = 0;
    }

    public int getIndex()
    {
        return index;
    }

    public int getType()
    {
        return type;
    }

    @Override
    public String toString()
    {
        return String.valueOf(index) + "(sp)";
    }
}
