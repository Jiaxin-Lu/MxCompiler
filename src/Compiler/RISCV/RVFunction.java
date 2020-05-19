package Compiler.RISCV;

import Compiler.RISCV.RVInstruction.Call;
import Compiler.RISCV.RVInstruction.InstI;
import Compiler.RISCV.RVInstruction.RVInstruction;
import Compiler.RISCV.RVOperand.RVImmediate;
import Compiler.RISCV.RVOperand.RVRegister;
import Compiler.RISCV.RVOperand.RVVirtualRegister;
import Compiler.RISCV.RVOperand.StackData;

import java.util.*;

import static Compiler.RISCV.RVOperand.RVPhysicalRegister.allRegisters;

public class RVFunction
{
    private String name;
    private RVBasicBlock entryBlock;
    private RVBasicBlock exitBlock;
    private List<RVRegister> parameterList = new ArrayList<>();
    private List<RVBasicBlock> preOrderBlockList = new ArrayList<>();
    private RVRegister inClassThis = null;

    private List<RVBasicBlock> reverseCFGPostOrderBlockList = null;

    public RVFunction(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
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
        this.inClassThis = new RVVirtualRegister("this");
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
        return preOrderBlockList;
    }

    private Set<RVBasicBlock> dfsVisit = null;
    
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

    public void addBlockList(RVBasicBlock basicBlock)
    {
        preOrderBlockList.add(basicBlock);
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
    private List<RVRegister> allParameterList = null;

    public List<RVRegister> getAllParameterList()
    {
        if (allParameterList != null) return allParameterList;
        allParameterList = new ArrayList<>();
        if (inClassThis != null) allParameterList.add(inClassThis);
        allParameterList.addAll(parameterList);
        return allParameterList;
    }
    public int calcAllParameterSize()
    {
        return getAllParameterList().size();
    }

    //RVRegister
    public List<RVRegister> registerList = new ArrayList<>();
    public RVVirtualRegister addRegister(String name)
    {
        RVVirtualRegister reg = new RVVirtualRegister(name + "_" + registerList.size());
        registerList.add(reg);
        return reg;
    }

    //RVStack Slot
    private List< List<StackData> > callStackSlot = new ArrayList<>();
    private List<StackData> spillStackSlot = new ArrayList<>();

    public void addCallStackSlot(List<StackData> slot)
    {
        callStackSlot.add(slot);
    }

    public void addSpillStackSlot(StackData slot)
    {
        spillStackSlot.add(slot);
    }

    public int stackSlotAlloc()
    {
        int maxCallArguments = 0;
        for (List<StackData> slot : callStackSlot)
        {
            maxCallArguments = Math.max(maxCallArguments, slot.size());
        }
        int size = maxCallArguments + spillStackSlot.size();
        size = (size + 3) / 4 * 4;
        if (size > 0)
        {
            RVInstruction inst = new InstI(entryBlock, InstI.Op.addi, allRegisters.get("sp"), allRegisters.get("sp"), new RVImmediate(-size*4));
            entryBlock.headInst.addPrevInst(inst);
            inst = new InstI(exitBlock, InstI.Op.addi, allRegisters.get("sp"), allRegisters.get("sp"), new RVImmediate(size * 4));
            exitBlock.tailInst.addPrevInst(inst);
        }
        return size;
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
