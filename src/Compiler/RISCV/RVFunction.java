package Compiler.RISCV;

import Compiler.RISCV.RVInstruction.Call;
import Compiler.RISCV.RVInstruction.RVInstruction;
import Compiler.RISCV.RVOperand.RVRegister;
import Compiler.RISCV.RVOperand.VirtualRegister;

import java.util.*;

public class RVFunction
{
    private String name;
    private String builtinName;
    private RVBasicBlock entryBlock = new RVBasicBlock(this, "entry");
    private RVBasicBlock exitBlock = new RVBasicBlock(this, "exit");
    private List<RVRegister> parameterList = new ArrayList<>();
    private List<RVBasicBlock> preOrderBlockList = null;
    private List<RVBasicBlock> postOrderBlockList = null;
    private Set<RVBasicBlock> dfsVisit = null;
    private RVRegister inClassThis = null;

    private List<RVBasicBlock> reverseCFGPostOrderBlockList = null;

    public RVFunction(String name)
    {
        this.name = name;
    }

    public RVFunction(String name, String builtinName)
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

    public void addParameterList(RVRegister parameter)
    {
        parameterList.add(parameter);
    }

    public List<RVRegister> getParameterList()
    {
        return parameterList;
    }

    public void setParameterList(List<RVRegister> parameterList)
    {
        this.parameterList = parameterList;
    }

    public RVBasicBlock getEntryBlock()
    {
        return entryBlock;
    }

    public void setEntryBlock(RVBasicBlock entryBlock)
    {
        this.entryBlock = entryBlock;
    }

    public RVBasicBlock getExitBlock()
    {
        return exitBlock;
    }

    public void setExitBlock(RVBasicBlock exitBlock)
    {
        this.exitBlock = exitBlock;
    }

    public void setInClassThis()
    {
        this.inClassThis = new VirtualRegister("this");
    }

    public void setInClassThis(RVRegister inClassThis)
    {
        this.inClassThis = inClassThis;
    }

    public RVRegister getInClassThis()
    {
        return inClassThis;
    }

    public List<RVBasicBlock> getPreOrderBlockList()
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

    public List<RVBasicBlock> getPostOrderBlockList()
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

    public void dfsBasicBlock(RVBasicBlock basicBlock)
    {
        basicBlock.preOrderIndex = preOrderBlockList.size();
        preOrderBlockList.add(basicBlock);
        dfsVisit.add(basicBlock);
        for (RVBasicBlock successor : basicBlock.getSuccessors())
        {
            if (!dfsVisit.contains(successor))
            {
                successor.dfsFatherBlock = basicBlock;
                dfsBasicBlock(successor);
            }
        }
    }

    public List<RVBasicBlock> getReverseCFGPostOrderBlockList()
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

    public void reverseCFGPostOrderDFS(RVBasicBlock basicBlock)
    {
        dfsVisit.add(basicBlock);
        for (RVBasicBlock predecessor : basicBlock.getPredecessors())
            if (!dfsVisit.contains(predecessor))
            {
                reverseCFGPostOrderDFS(predecessor);
            }
        reverseCFGPostOrderBlockList.add(basicBlock);
    }


    public boolean canReach(RVBasicBlock basicBlock)
    {
        return dfsVisit.contains(basicBlock);
    }
    public void accept(RVVisitor visitor)
    {
        visitor.visit(this);
    }

    //Callee
    public Set<RVFunction> callee = new HashSet<>();
    public Set<RVFunction> recursiveCallee = new HashSet<>();

    public void updateCallee()
    {
        callee.clear();
        for (RVBasicBlock basicBlock : getPreOrderBlockList())
        {
            for (RVInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            {
                if (inst instanceof Call)
                    callee.add(((Call) inst).getFunction());
            }
        }
    }

    //Unused RVFunction
    public boolean isUnused = false;

    //All Parameter
    private List<RVRegister> allParameterList = new ArrayList<>();

    public List<RVRegister> getAllParameterList()
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

    //Loop Analysis
    public Set<RVBasicBlock> loopHeader = new HashSet<>();
    public Map<RVBasicBlock, Set<RVBasicBlock>> loopBacker = new HashMap<>();
    public Map<RVBasicBlock, Set<RVBasicBlock>> belongLoopHeader = new HashMap<>();
    public Map<RVBasicBlock, Set<RVBasicBlock>> loopGroup = new HashMap<>();
    public Map<RVBasicBlock, Set<RVBasicBlock>> loopExit = new HashMap<>();

    //Register Allocation
    public int spillCnt = 0;
}
