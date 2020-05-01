package Compiler.IR;

import Compiler.IR.IRInstruction.*;
import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.Value;
import Compiler.IR.Operand.VirtualRegister;

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

    private List<BasicBlock> reverseCFGPostOrderBlockList = null;

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

    public void setInClassThis(Register inClassThis)
    {
        this.inClassThis = inClassThis;
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
        for (int i = preOrderBlockList.size() - 1; i >= 0; --i)
        {
            preOrderBlockList.get(i).postOrderIndex = preOrderBlockList.size() - i;
        }
    }

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

    public List<BasicBlock> getReverseCFGPostOrderBlockList()
    {
        if (reverseCFGPostOrderBlockList == null) calcReverseCFGPostOrderBlockList();
        return reverseCFGPostOrderBlockList;
    }

    public void calcReverseCFGPostOrderBlockList()
    {
        reverseCFGPostOrderBlockList = new LinkedList<>();
        dfsVisit = new HashSet<>();
        reverseCFGPostOrderDFS(exitBlock);
        for (int i = 0; i < reverseCFGPostOrderBlockList.size(); ++i)
            reverseCFGPostOrderBlockList.get(i).reverseCFGPostOrderIndex = i;
    }

    public void reverseCFGPostOrderDFS(BasicBlock basicBlock)
    {
        dfsVisit.add(basicBlock);
        for (BasicBlock predecessor : basicBlock.getPredecessors())
            if (!dfsVisit.contains(predecessor))
            {
                reverseCFGPostOrderDFS(predecessor);
            }
        reverseCFGPostOrderBlockList.add(basicBlock);
    }


    public boolean canReach(BasicBlock basicBlock)
    {
        return dfsVisit.contains(basicBlock);
    }
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }

    //Callee
    public Set<Function> callee = new HashSet<>();
    public Set<Function> recursiveCallee = new HashSet<>();

    public void updateCallee()
    {
        callee.clear();
        for (BasicBlock basicBlock : getPreOrderBlockList())
        {
            for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            {
                if (inst instanceof Call)
                    callee.add(((Call) inst).getFunction());
            }
        }
    }

    //Global Variable
    public Set<GlobalVariable> defGlobalVariable = new HashSet<>();
    public Map<GlobalVariable, VirtualRegister> usedTempGlobalVariable = new HashMap<>();
    public Set<GlobalVariable> recursiveDefGlobalVariable = new HashSet<>();
    public Set<GlobalVariable> recursiveUsedGlobalVariable = new HashSet<>();

    // SSA
    public Set<VirtualRegister> globals = new HashSet<>();
    public List<Call> callInstructionList = new LinkedList<>();

    //Unused Function
    public boolean isUnused = false;

    //All Parameter
    private List<Register> allParameterList = new ArrayList<>();

    public List<Register> getAllParameterList()
    {
        allParameterList.clear();
        if (inClassThis != null) allParameterList.add(inClassThis);
        allParameterList.addAll(parameterList);
        return allParameterList;
    }
    public int calcAllParameterSize()
    {
        return getAllParameterList().size();
    }

    //call Arguments
    public int callArgumentSize;
    public void calcCallArgumentSize(int size)
    {
        callArgumentSize = Math.max(callArgumentSize, size);
    }

    //TODO : MAYBE A LOT MORE BUT I DON'T KNOW NOW.
}
