package Compiler.IR;

import Compiler.IR.IRInstruction.*;
import Compiler.IR.Operand.Register;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Function
{
    private String name;
    private String builtinName;
    private BasicBlock entryBlock = new BasicBlock(this, "entry");
    private BasicBlock exitBlock = new BasicBlock(this, "exit");
    private List<Return> returnList = new ArrayList<>();
    private List<Register> parameterList = new ArrayList<>();
    private List<BasicBlock> dfsOrderBlockList = null;
    private Set<BasicBlock> dfsVisit = null;

    public Function(String name)
    {
        this.name = name;
    }

    public Function(String name, String builtinName)
    {
        this.name = name;
        this.builtinName = builtinName;
    }

    public String getBuiltinName()
    {
        return builtinName;
    }

    public String getName()
    {
        return name;
    }

    public void addReturnList(Return returnInst)
    {
        returnList.add(returnInst);
    }

    public void addParameterList(Register parameter)
    {
        parameterList.add(parameter);
    }

    public List<Return> getReturnList()
    {
        return returnList;
    }

    public List<Register> getParameterList()
    {
        return parameterList;
    }

    public void setParameterList(List<Register> parameterList)
    {
        this.parameterList = parameterList;
    }

    public BasicBlock getEntryBlock()
    {
        return entryBlock;
    }

    public void setEntryBlock(BasicBlock entryBlock)
    {
        this.entryBlock = entryBlock;
    }

    public BasicBlock getExitBlock()
    {
        return exitBlock;
    }

    public void setExitBlock(BasicBlock exitBlock)
    {
        this.exitBlock = exitBlock;
    }

    public List<BasicBlock> getDfsOrderBlockList()
    {
        if (dfsOrderBlockList == null)
            calcDfsOrderBlockList();
        return dfsOrderBlockList;
    }
    public void calcDfsOrderBlockList()
    {
        dfsOrderBlockList = new ArrayList<>();
        dfsVisit = new HashSet<>();
        dfsBasicBlock(entryBlock);
    }
    public void dfsBasicBlock(BasicBlock basicBlock)
    {
        basicBlock.dfn = dfsOrderBlockList.size();
        dfsOrderBlockList.add(basicBlock);
        dfsVisit.add(basicBlock);
        for (BasicBlock successor : basicBlock.getSuccessors())
        {
            if (!dfsVisit.contains(successor))
            {
                successor.dfsFatherBlock = basicBlock;
                dfsBasicBlock(successor);
            }
        }
    }
    public boolean canReach(BasicBlock basicBlock)
    {
        return dfsVisit.contains(basicBlock);
    }
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }

    //TODO : MAYBE A LOT MORE BUT I DON'T KNOW NOW.
}
