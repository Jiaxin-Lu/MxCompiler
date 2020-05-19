package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.*;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.*;

import java.util.*;

public class FunctionInliner extends Pass
{
    private Map<Function, Integer> functionCallCountMap = new HashMap<>();
    private Map<Function, Integer> functionInstCountMap = new HashMap<>();

    private Map<Function, Function> functionFunctionMap = new HashMap<>();
    private Map<Function, Integer> functionCountMap = new HashMap<>();

    private static final int INLINE_INSTRUCTION_LIMIT = 200;
    private static final int INLINE_DEP_LIMIT = 5;

    boolean changed = false;

    public FunctionInliner(IRRoot irRoot)
    {
        super(irRoot);
    }

    public boolean run()
    {
        countStaticData();
        changed = false;
        nonRecursiveInline();
        recursiveInline();
        return changed;
    }

    private void countStaticData()
    {
        for (Function function : irRoot.getFunctionMap().values())
        {
            functionCallCountMap.put(function, 0);
        }
        for (Function function : irRoot.getFunctionMap().values())
        {
            int instCount = 0;
            for (BasicBlock basicBlock : function.getPreOrderBlockList())
            {
                for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
                {
                    instCount ++;
                    if (inst instanceof CallInst)
                    {
                        Function callee = ((CallInst) inst).getFunction();
                        if (functionCallCountMap.containsKey(callee))
                            functionCallCountMap.put(callee, (functionCallCountMap.get(callee)) + 1);
                    }
                }
            }
            functionInstCountMap.put(function, instCount);
        }
    }

    private Function copyFunction(Function function)
    {
        int functionCount = functionCountMap.getOrDefault(function, 0);
        functionCount ++;
        functionCountMap.put(function, functionCount);
        Function newFunction = new Function("fake_" + function.getName() + "_" + functionCount);
        Map<BasicBlock, BasicBlock> basicBlockMap = new HashMap<>();
        Map<Operand, Operand> registerMap = new HashMap<>();
        for (BasicBlock oldBlock : function.getPreOrderBlockList())
        {
            BasicBlock newBlock = new BasicBlock(newFunction, oldBlock.getName());
            basicBlockMap.put(oldBlock, newBlock);
        }

        newFunction.setEntryBlock(basicBlockMap.get(function.getEntryBlock()));
        newFunction.setExitBlock(basicBlockMap.get(function.getExitBlock()));
        newFunction.setInClassThis(function.getInClassThis());
        newFunction.setParameterList(function.getParameterList());

        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            BasicBlock newBlock = basicBlockMap.get(basicBlock);
            for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            {
                if (inst == basicBlock.tailInst)
                {
                    newBlock.endThis(inst.copyInst(basicBlockMap, registerMap));
                } else {
                    newBlock.addInst2Tail(inst.copyInst(basicBlockMap, registerMap));
                }
            }
        }
        return newFunction;
    }

    private void recursiveInline()
    {
        boolean isChanged = true;
        int inlineDep = 0;
        while (isChanged && inlineDep < INLINE_DEP_LIMIT)
        {
            isChanged = false;
            functionFunctionMap.clear();
            for (Function function : irRoot.getFunctionMap().values())
            if (function.recursiveCallee.contains(function))
            {
                functionFunctionMap.put(function, copyFunction(function));
            }
            for (Function function : irRoot.getFunctionMap().values())
            {
                for (BasicBlock basicBlock : function.getPreOrderBlockList())
                {
                    for (IRInstruction inst = basicBlock.headInst, nextInst; inst != null; inst = nextInst)
                    {
                        nextInst = inst.getNextInst();
                        if (inst instanceof CallInst && worthRecursiveInline(((CallInst) inst).getFunction()))
                        {
                            isChanged = true;
                            changed = true;
                            Function callee = ((CallInst) inst).getFunction();
                            nextInst = inlineFunction((CallInst) inst);
                            functionInstCountMap.put(function, functionInstCountMap.get(function) + functionInstCountMap.get(callee));
                        }
                    }
                }
                function.calcPreOrderBlockList();
            }
            ++inlineDep;
        }
        for (Function function : irRoot.getFunctionMap().values())
        {
            function.updateCallee();
        }
        irRoot.updateRecursiveCallee();
    }

    private void nonRecursiveInline()
    {
        boolean isChanged = true;
        while (isChanged)
        {
            isChanged = false;
            for (Function function : irRoot.getFunctionMap().values())
            {
                for (BasicBlock basicBlock : function.getPreOrderBlockList())
                {
                    for (IRInstruction inst = basicBlock.headInst, nextInst; inst != null; inst = nextInst)
                    {
                        nextInst = inst.getNextInst();
                        if (inst instanceof CallInst && worthNonRecursiveInline(((CallInst) inst).getFunction()))
                        {
                            Function callee = ((CallInst) inst).getFunction();
                            isChanged = true;
                            changed = true;
                            nextInst = inlineFunction((CallInst) inst);
                            functionInstCountMap.put(function, functionInstCountMap.get(function) + functionInstCountMap.get(callee));
                            functionCallCountMap.put(callee, functionCallCountMap.get(callee) - 1);
                        }
                    }
                }
                function.calcPreOrderBlockList();
            }
            for (Map.Entry<Function, Integer> entry : functionCallCountMap.entrySet())
            {
                if (entry.getValue() == 0 && !entry.getKey().getName().equals("_init_"))
                {
                    irRoot.removeFunction(entry.getKey());
                }
            }
        }
        for (Function function : irRoot.getFunctionMap().values())
        {
            function.updateCallee();
        }
        irRoot.updateRecursiveCallee();
    }

    private IRInstruction inlineFunction(CallInst callInst)
    {
        Function caller = callInst.getCurrentBlock().getFunction();
        Function callee = functionFunctionMap.getOrDefault(callInst.getFunction(), callInst.getFunction());
//        Function callee = callInst.getFunction();
        //spilt and add inst to split
        BasicBlock currentBlock = callInst.getCurrentBlock();
        BasicBlock spiltBlock = new BasicBlock(caller, "split_block");
        for (BasicBlock successor : currentBlock.getSuccessors())
        {
            successor.replacePredecessor(currentBlock, spiltBlock);
        }
        List<IRInstruction> splitInst = new ArrayList<>();
        for (IRInstruction inst = currentBlock.tailInst, preInst; inst != callInst; inst = preInst)
        {
            preInst = inst.getPrevInst();
            callInst.getCurrentBlock().removeTailInst();
            splitInst.add(inst);
        }
        for (int i = splitInst.size() - 1; i >= 0; i--)
        {
            IRInstruction inst = splitInst.get(i);
            inst.setCurrentBlock(spiltBlock);
            if (inst instanceof ReturnInst || inst instanceof JumpInst || inst instanceof BranchInst)
            {
                spiltBlock.endThis(inst);
            }
            else {
                spiltBlock.addInst2Tail(inst);
            }
        }
        spiltBlock.headInst.setPrevInst(null);

        //make temporary
        Map<BasicBlock, BasicBlock> basicBlockMap = new HashMap<>();
        Map<Operand, Operand> registerMap = new HashMap<>();
        basicBlockMap.put(callee.getEntryBlock(), currentBlock);
        basicBlockMap.put(callee.getExitBlock(), spiltBlock);
        for (GlobalVariable globalVariable : irRoot.getGlobalVariableList())
        {
            registerMap.put(globalVariable, globalVariable);
        }
        for (StaticStr staticStr : irRoot.getStaticStrList())
        {
            registerMap.put(staticStr.getBase(), staticStr.getBase());
        }
        if (caller.getExitBlock() == currentBlock) caller.setExitBlock(spiltBlock);

        //parameter
        for (int i = 0; i < callInst.getParameterList().size(); i++)
        {
            Operand oldParameter = callee.getParameterList().get(i);
            VirtualRegister newParameter = new Value(oldParameter.getName());
            callInst.addPrevInst(new MoveInst(currentBlock, callInst.getParameterList().get(i), newParameter));
            registerMap.put(oldParameter, newParameter);
        }
        for (BasicBlock oldBlock : callee.getPreOrderBlockList())
        {
            if (!basicBlockMap.containsKey(oldBlock))
            {
                BasicBlock newBlock = new BasicBlock(caller, "fake_" + oldBlock.getName());
                basicBlockMap.put(oldBlock, newBlock);
            }
        }
        callInst.removeThis();
        //copy function
        IRInstruction splitHeadInst = spiltBlock.headInst;
        for (BasicBlock oldBlock : callee.getPreOrderBlockList())
        {
            BasicBlock basicBlock = basicBlockMap.get(oldBlock);
            for (IRInstruction inst = oldBlock.headInst; inst != null; inst = inst.getNextInst())
            {
                for (Register reg : inst.getUsedRegister())
                {
                    if (!registerMap.containsKey(reg))
                    {
//                        System.err.println("why used is not in registerMap");
                        Value newReg = new Value(reg.getName());
                        registerMap.put(reg, newReg);
                    }
                }
                if (inst.getDefRegister() != null)
                {
                    Register reg = inst.getDefRegister();
                    if (!registerMap.containsKey(reg))
                    {
                        Value newReg = new Value(reg.getName());
                        registerMap.put(reg, newReg);
                    }
                }
                if (basicBlock == spiltBlock)
                {
                    if (inst != oldBlock.tailInst)
                    {
                        IRInstruction newInst = inst.copyInst(basicBlockMap, registerMap);
                        splitHeadInst.addPrevInst(newInst);
                    }
                } else {
                    if (inst == oldBlock.tailInst)
                    {
                        basicBlock.endThis(inst.copyInst(basicBlockMap, registerMap));
                    } else {
                        IRInstruction newInst = inst.copyInst(basicBlockMap, registerMap);
                        basicBlock.addInst2Tail(newInst);
                    }
                }
            }
        }
        if (!currentBlock.isEnded())
        {
            currentBlock.endThis(new JumpInst(currentBlock, spiltBlock));
        }
        ReturnInst ret = (ReturnInst) callee.getExitBlock().tailInst;
        if (ret.getReturnValue() != null)
            splitHeadInst.addPrevInst(new MoveInst(spiltBlock, registerMap.getOrDefault(ret.getReturnValue(), ret.getReturnValue()), callInst.getDst()));
        return spiltBlock.headInst;
    }

    private boolean worthNonRecursiveInline(Function function)
    {
        if (!functionCallCountMap.containsKey(function)) return false;
        if (function.recursiveCallee.contains(function)) return false;
        if (function.getInClassThis() != null) return false;
        return functionInstCountMap.get(function) < INLINE_INSTRUCTION_LIMIT;
    }

    private boolean worthRecursiveInline(Function function)
    {
        if (!functionCallCountMap.containsKey(function)) return false;
        if (function.getInClassThis() != null) return false;
        return functionInstCountMap.get(function) < INLINE_INSTRUCTION_LIMIT;
    }

}
