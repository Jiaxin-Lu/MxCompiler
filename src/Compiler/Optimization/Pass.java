package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.IRInstruction;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.Register;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public abstract class Pass
{
    protected IRRoot irRoot;
//    protected boolean changed;

    Pass(IRRoot irRoot)
    {
        this.irRoot = irRoot;
    }

//    public boolean isChanged()
//    {
//        return changed;
//    }

    public abstract boolean run();

    //def-use chain
    protected Map<Register, IRInstruction> def = new HashMap<>();
    protected Map<Register, Set<IRInstruction>> used = new HashMap<>();

    public void resolveDefUseChain(Function function)
    {
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            {
                Register defReg = inst.getOriginRegister();
                if (defReg != null)
                {
                    def.put(defReg, inst);
                    if (!used.containsKey(defReg))
                        used.put(defReg, new HashSet<>());
                }
                for (Register useReg : inst.getUsedRegister())
                {
                    if (!used.containsKey(useReg))
                        used.put(useReg, new HashSet<>());
                    used.get(useReg).add(inst);
                }
            }
        }
    }
}
