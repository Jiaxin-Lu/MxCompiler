package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.Binary;
import Compiler.IR.IRInstruction.Call;
import Compiler.IR.IRInstruction.IRInstruction;
import Compiler.IR.IRInstruction.Phi;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.*;

public class SSAConstructor extends Pass
{
    public SSAConstructor(IRRoot irRoot)
    {
        super(irRoot);
    }

    @Override
    public boolean run()
    {
        for (Function function : irRoot.getFunctionMap().values())
        {
            findGlobals(function);
            insertPhiFunction(function);
            renameVariables(function);
        }
        return true;
    }

    public void findGlobals(Function function)
    {
        function.globals.clear();
        List<BasicBlock> preOrderBlockList = function.getPreOrderBlockList();
        Set<VirtualRegister> varKill = new HashSet<>();
        for (BasicBlock basicBlock : preOrderBlockList)
        {
            varKill.clear();
            for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            {
                List<Register> usedRegister = inst.getUsedRegister();
                Register originRegister = inst.getDefRegister();
                for (Register register : usedRegister)
                {
                    if (register instanceof VirtualRegister)
                    {
                        if (!varKill.contains(register))
                            function.globals.add((VirtualRegister) register);
                        if (((VirtualRegister) register).defBlocks == null)
                            ((VirtualRegister) register).defBlocks = new HashSet<>();
                    }
                }
                if (originRegister instanceof VirtualRegister)
                {
                    varKill.add((VirtualRegister) originRegister);
                    if (((VirtualRegister) originRegister).defBlocks == null)
                        ((VirtualRegister) originRegister).defBlocks = new HashSet<>();
                    ((VirtualRegister) originRegister).defBlocks.add(basicBlock);
                }
            }
        }
    }

    public void insertPhiFunction(Function function)
    {
        Queue<BasicBlock> workList = new LinkedList<>();
        Set<BasicBlock> visited = new HashSet<>();
        for (VirtualRegister register : function.globals)
        {
            visited.clear();
            workList.addAll(register.defBlocks);
            while (!workList.isEmpty())
            {
                BasicBlock b = workList.remove();
                for (BasicBlock d : b.DominanceFrontier)
                {
                    if (!visited.contains(d))
                    {
                        visited.add(d);
                        d.addInst2Head(new Phi(d, register));
                        workList.add(d);
                    }
                }
            }
        }
    }

    public void renameVariables(Function function)
    {
        initializeParameters(function);
        rename(function.getEntryBlock());
        setBackParameters(function);
    }

    private void initializeParameters(Function function)
    {
        VirtualRegister functionThis = (VirtualRegister) function.getInClassThis();
        if (functionThis != null)
        {
            if (functionThis.defBlocks != null)
            {
                function.setInClassThis(functionThis.getSSARegister(functionThis.SSANewID()));
            } else
            {
                function.setInClassThis(null);
                for (Call call : function.callInstructionList)
                {
                    call.setPointer(null);
                }
            }
        }

        for (int i = 0; i < function.getParameterList().size(); i++)
        {
            VirtualRegister parameter = (VirtualRegister) function.getParameterList().get(i);
            if (parameter.defBlocks != null)
            {
                function.getParameterList().set(i, parameter.getSSARegister(parameter.SSANewID()));
            } else
            {
                for (Call call : function.callInstructionList)
                {
                    call.getParameterList().set(i, null);
                }
                function.getParameterList().set(i, null);
            }
        }
        function.getParameterList().removeAll(Collections.singleton(null));
        for (Call call : function.callInstructionList)
        {
            call.getParameterList().removeAll(Collections.singleton(null));
        }
    }

    private void setBackParameters(Function function)
    {
        VirtualRegister functionThis = (VirtualRegister) function.getInClassThis();
        if (functionThis != null && functionThis.stack != null)
        {
            functionThis.getOriginal().stack.pop();
        }
        for (Register parameter : function.getParameterList())
        {
            ((VirtualRegister)parameter).getOriginal().stack.pop();
        }
    }

    private void rename(BasicBlock basicBlock)
    {
        for (IRInstruction inst = basicBlock.headInst; inst instanceof Phi;  inst = inst.getNextInst())
        {
            VirtualRegister dst = (VirtualRegister) ((Phi) inst).getDst();
            ((Phi) inst).setDst(dst.getSSARegister(dst.SSANewID()));
        }

        for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
        {
            if (!(inst instanceof Phi))
            {
                inst.renameUsedRegisterSSA();
                inst.renameDstRegisterSSA();
            }
        }

        for (BasicBlock successor : basicBlock.getSuccessors())
        {
            for (IRInstruction inst = successor.headInst; inst != null; inst = inst.getNextInst())
            {
                if (!(inst instanceof Phi)) break;
                VirtualRegister origin = ((VirtualRegister)(((Phi) inst).getDst())).getOriginal();
                VirtualRegister src = origin.stack.empty() ? null : origin.getSSARegister(origin.stack.peek());
                ((Phi) inst).addPath(basicBlock, src);
            }
        }

        for (BasicBlock successor : basicBlock.DominatorTreeSuccessor)
        {
            rename(successor);
        }

        for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
        {
            if (inst.getDefRegister() != null)
            {
                ((VirtualRegister)inst.getDefRegister()).getOriginal().stack.pop();
            }
        }
    }
}
