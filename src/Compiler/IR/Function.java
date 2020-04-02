package Compiler.IR;

import Compiler.IR.IRInstruction.*;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.Value;
import Compiler.Parser.MxParser;

import java.util.*;

public class Function
{
    private String name;
    private String builtinName;
    private BasicBlock entryBlock = new BasicBlock(this, "entry");
    private BasicBlock exitBlock = new BasicBlock(this, "exit");
    private List<Return> returnList = new ArrayList<>();
    private List<Register> parameterList = new ArrayList<>();
    private List<BasicBlock> preOrderBlockList = null;
    private List<BasicBlock> postOrderBlockList = null;
    private Set<BasicBlock> dfsVisit = null;
    private Register inClassThis = null;

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

    public void setInClassThis()
    {
        this.inClassThis = new Value("this");
    }

    public Register getInClassThis()
    {
        return inClassThis;
    }

    public List<BasicBlock> getPreOrderBlockList()
    {
        if (preOrderBlockList == null)
            calcPreOrderBlockList();
        return preOrderBlockList;
    }
    public void calcPreOrderBlockList()
    {
        preOrderBlockList = new ArrayList<>();
        dfsVisit = new HashSet<>();
        dfsBasicBlock(entryBlock);
    }
//    public void calcPostOrderBlockList()
//    {
//    }
    public List<BasicBlock> getPostOrderBlockList()
    {
        if (postOrderBlockList == null)
        {
            postOrderBlockList = new ArrayList<>();
            postOrderBlockList.addAll(getPreOrderBlockList());
            Collections.reverse(postOrderBlockList);
        }
        for (int i = 0; i < postOrderBlockList.size(); ++i)
            postOrderBlockList.get(i).postOrderIndex = i;
        return postOrderBlockList;
    }
    public void dfsBasicBlock(BasicBlock basicBlock)
    {
        basicBlock.preOrderIndex = preOrderBlockList.size();
        preOrderBlockList.add(basicBlock);
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
