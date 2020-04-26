package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.*;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.Value;
import Compiler.IR.Operand.VirtualRegister;

import java.util.*;

public class GlobalVariableResolver
{
    private IRRoot irRoot;

//    public GlobalVariableResolver(IRRoot irRoot)
//    {
//        this.irRoot = irRoot;
//    }

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
            Return ret = function.getReturnList().get(0);
            for (GlobalVariable globalVariable : function.defGlobalVariable)
            {
                ret.addPrevInst(new Store(ret.getCurrentBlock(), function.usedTempGlobalVariable.get(globalVariable),
                        globalVariable, true));
            }
        }
    }

    private VirtualRegister getTempGlobal(GlobalVariable register, Map<GlobalVariable, VirtualRegister> usedTempGlobalVariable)
    {
        VirtualRegister tempGlobal = usedTempGlobalVariable.get(register);
        if (tempGlobal == null)
        {
            tempGlobal = new Value(register.getName());
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
                if ((inst instanceof Load && ((Load) inst).isForGlobal()) ||
                        (inst instanceof Store && ((Store) inst).isGlobal()))
                    continue;
                Register defRegister = inst.getOriginRegister();
                List<Register> usedRegister = inst.getUsedRegister();
                if (!usedRegister.isEmpty())
                {
                    Map<Register, Register> renameMap = new HashMap<>();
                    for (Register register : usedRegister)
                    {
                        if (register instanceof GlobalVariable && !((GlobalVariable)register).isString())
                            renameMap.put(register, getTempGlobal((GlobalVariable) register, function.usedTempGlobalVariable));
                        else renameMap.put(register, register);
                    }
                    inst.setUsedRegister(renameMap);
                }
                if (defRegister instanceof GlobalVariable && !((GlobalVariable)defRegister).isString())
                {
                    inst.setOriginRegister(getTempGlobal((GlobalVariable) defRegister, function.usedTempGlobalVariable));
                    function.defGlobalVariable.add((GlobalVariable) defRegister);
                }
            }
        }
        for (Map.Entry<GlobalVariable, VirtualRegister> entry : function.usedTempGlobalVariable.entrySet())
        {
            function.getEntryBlock().addInst2Head(new Load(function.getEntryBlock(), entry.getKey(), entry.getValue(), true));
        }
    }

    private void reloadGlobalVariable(Function function)
    {
        Set<GlobalVariable> usedGlobalVariable = function.usedTempGlobalVariable.keySet();
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            {
                if (inst instanceof Call)
                {
                    Function callFunc = ((Call) inst).getFunction();
                    for (GlobalVariable defGlobalVariable : function.defGlobalVariable)
                    {
                        if (callFunc.recursiveUsedGlobalVariable.contains(defGlobalVariable))
                        {
                            inst.addPrevInst(new Store(basicBlock,
                                    function.usedTempGlobalVariable.get(defGlobalVariable), defGlobalVariable, true));
                        }
                    }

                    if (!callFunc.recursiveDefGlobalVariable.isEmpty())
                    {
                        Set<GlobalVariable> reloadSet = new HashSet<>(callFunc.recursiveDefGlobalVariable);
                        reloadSet.retainAll(usedGlobalVariable);
                        for (GlobalVariable globalVariable : reloadSet)
                        {
                            inst.addPrevInst(new Load(basicBlock,
                                    globalVariable, function.usedTempGlobalVariable.get(globalVariable), true));
                        }
                    }
                }
            }
        }
    }
}
