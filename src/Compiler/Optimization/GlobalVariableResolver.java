package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.*;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.*;
import Compiler.Utils.Width;

import java.util.*;

public class GlobalVariableResolver
{
    private IRRoot irRoot;

    public GlobalVariableResolver(IRRoot irRoot)
    {
        this.irRoot = irRoot;
    }

    public void run()
    {
        for (Function function : irRoot.getFunctionMap().values())
        {
            renameGlobalVariable(function);
        }
        for (Function function : irRoot.getFunctionMap().values())
        {
            function.recursiveUsedGlobalVariable.addAll(function.usedTempGlobalVariable.keySet());
            function.recursiveDefGlobalVariable.addAll(function.defGlobalVariable);
            for (Function f : function.recursiveCallee)
            {
                function.recursiveUsedGlobalVariable.addAll(f.usedTempGlobalVariable.keySet());
                function.recursiveDefGlobalVariable.addAll(f.defGlobalVariable);
            }
        }
        for (Function function : irRoot.getFunctionMap().values())
        {
            if (!function.usedTempGlobalVariable.keySet().isEmpty())
                reloadGlobalVariable(function);
        }
        for (Function function : irRoot.getFunctionMap().values())
        if (function != irRoot.getFunctionMap().get("_init_"))
        {
            ReturnInst ret = function.getReturnList().get(0);
            for (GlobalVariable globalVariable : function.defGlobalVariable)
            {
                ret.addPrevInst(new StoreInst(ret.getCurrentBlock(), function.usedTempGlobalVariable.get(globalVariable),
                        globalVariable, true));
            }
        }
    }

    public void allocGlobalVariable()
    {
        Function initFunction = irRoot.getFunctionMap().get("_init_");
        BasicBlock entryInit = initFunction.getEntryBlock();
        for (GlobalVariable globalVariable : irRoot.getGlobalVariableList())
        {
            entryInit.addInst2Head(new AllocInst(entryInit, new Immediate(Width.regWidth), globalVariable));
        }
//        for (Function function : irRoot.getFunctionMap().values())
//        {
//            for (BasicBlock basicBlock : function.getPreOrderBlockList())
//            {
//                for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
//                {
//                    if (inst instanceof LoadInst && ((LoadInst) inst).isForGlobal())
//                    {
//                        ((LoadInst) inst).setGlobalPtr(((GlobalVariable) ((LoadInst) inst).getSrc()).getGlobalPtr());
//                    } else if (inst instanceof StoreInst && ((StoreInst) inst).isForGlobal())
//                    {
//                        ((StoreInst) inst).setGlobalPtr(((GlobalVariable) ((StoreInst) inst).getDst()).getGlobalPtr());
//                    }
//                }
//            }
//        }
    }

    private VirtualRegister getTempGlobalVariable(GlobalVariable register, Map<GlobalVariable, VirtualRegister> usedTempGlobalVariable)
    {
        VirtualRegister tempGlobal = usedTempGlobalVariable.get(register);
        if (tempGlobal == null)
        {
            tempGlobal = new VirtualRegister(register.getName());
            usedTempGlobalVariable.put(register, tempGlobal);
        }
        return tempGlobal;
    }

    public void renameGlobalVariable(Function function)
    {
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            {
                if ((inst instanceof LoadInst && ((LoadInst) inst).isForGlobal()) ||
                        (inst instanceof StoreInst && ((StoreInst) inst).isForGlobal()))
                    continue;
                Register defRegister = inst.getDefRegister();
                List<Register> usedRegister = inst.getUsedRegister();
                if (!usedRegister.isEmpty())
                {
                    Map<Register, Register> renameMap = new HashMap<>();
                    for (Register register : usedRegister)
                    {
                        if (register instanceof GlobalVariable && !((GlobalVariable)register).isString())
                        {
                            renameMap.put(register, getTempGlobalVariable((GlobalVariable) register,
                                    function.usedTempGlobalVariable));
                        }
                        else renameMap.put(register, register);
                    }
                    inst.setUsedRegister(renameMap);
                }
                if (defRegister instanceof GlobalVariable && !((GlobalVariable)defRegister).isString())
                {
                    inst.setDefRegister(getTempGlobalVariable((GlobalVariable) defRegister, function.usedTempGlobalVariable));
                    function.defGlobalVariable.add((GlobalVariable) defRegister);
                }
            }
        }
        for (Map.Entry<GlobalVariable, VirtualRegister> entry : function.usedTempGlobalVariable.entrySet())
        {
            function.getEntryBlock().addInst2Head(new LoadInst(function.getEntryBlock(),
                    entry.getKey(), entry.getValue(), true));
        }
    }

    private void reloadGlobalVariable(Function function)
    {
        Set<GlobalVariable> usedGlobalVariable = function.usedTempGlobalVariable.keySet();
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            {
                if (inst instanceof CallInst)
                {
                    Function callFunc = ((CallInst) inst).getFunction();
                    for (GlobalVariable defGlobalVariable : function.defGlobalVariable)
                    {
                        if (callFunc.recursiveUsedGlobalVariable.contains(defGlobalVariable))
                        {
                            inst.addPrevInst(new StoreInst(basicBlock,
                                    function.usedTempGlobalVariable.get(defGlobalVariable), defGlobalVariable, true));
                        }
                    }

                    if (!callFunc.recursiveDefGlobalVariable.isEmpty())
                    {
                        Set<GlobalVariable> reloadSet = new HashSet<>(callFunc.recursiveDefGlobalVariable);
                        reloadSet.retainAll(usedGlobalVariable);
                        for (GlobalVariable globalVariable : reloadSet)
                        {
                            inst.addNextInst(new LoadInst(basicBlock,
                                    globalVariable, function.usedTempGlobalVariable.get(globalVariable), true));
                        }
                    }
                }
            }
        }
    }
}
