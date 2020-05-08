package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.*;

import java.util.LinkedList;
import java.util.Map;

public class CallInst extends IRInstruction
{
    private Function function;
    private LinkedList<Operand> parameterList = new LinkedList<>();
    private Operand dst;

    private Operand pointer;

    public CallInst(BasicBlock basicBlock, Function function, Operand dst)
    {
        super(basicBlock);
        this.function = function;
        this.dst = dst;
        resolveUsedRegister();
    }
    public CallInst(BasicBlock basicBlock, Function function, Operand dst, LinkedList<Operand> parameterList)
    {
        super(basicBlock);
        this.function = function;
        this.dst = dst;
        this.parameterList = parameterList;
        resolveUsedRegister();
    }

    public void addParameterList(Operand operand)
    {
        parameterList.add(operand);
        resolveUsedRegister();
    }

    public Operand getPointer()
    {
        return pointer;
    }

    public void setPointer(Operand pointer)
    {
        this.pointer = pointer;
    }

    public LinkedList<Operand> getParameterList()
    {
        return parameterList;
    }

    public Function getFunction()
    {
        return function;
    }

    public Operand getDst()
    {
        return dst;
    }

    public void setDst(Operand dst)
    {
        this.dst = dst;
    }

    private LinkedList<Operand> allParameterList = null;

    public LinkedList<Operand> getAllParameterList()
    {
        if (allParameterList != null) return allParameterList;
        allParameterList = new LinkedList<>();
        if (pointer != null)
            allParameterList.add(pointer);
        allParameterList.addAll(parameterList);
        return allParameterList;
    }

    @Override
    public Register getDefRegister()
    {
        return (Register) dst;
    }

    @Override
    public void setDefRegister(Register register)
    {
        if (dst != null)
        {
            dst = register;
        }
    }

    @Override
    public void resolveUsedRegister()
    {
        usedRegister.clear();
        for (Operand parameter : parameterList)
        {
            if (parameter instanceof Register) usedRegister.add((Register) parameter);
        }
        if (pointer instanceof Register) usedRegister.add((Register) pointer);
    }

    @Override
    public void replaceUsedRegister(Operand oldOperand, Operand newOperand)
    {
        for (int i = 0; i < parameterList.size(); ++i)
        {
            Operand parameter = parameterList.get(i);
            if (parameter == oldOperand)
                parameterList.set(i, newOperand);
        }
        if (pointer == oldOperand) pointer = newOperand;
        resolveUsedRegister();
    }

    @Override
    public void setUsedRegister(Map<Register, Register> registerMap)
    {
        for (int i = 0; i < parameterList.size(); ++i)
        {
            Operand parameter = parameterList.get(i);
            if (parameter instanceof Register)
            {
                parameterList.set(i, registerMap.get(parameter));
            }
        }
        if (pointer instanceof Register) pointer = registerMap.get(pointer);
        resolveUsedRegister();
    }

    @Override
    public IRInstruction copyInst(Map<BasicBlock, BasicBlock> basicBlockMap, Map<Operand, Operand> registerMap)
    {
        LinkedList<Operand> newParameterList = new LinkedList<>();
        for (Operand parameter : parameterList)
        {
            newParameterList.add(registerMap.getOrDefault(parameter, parameter));
        }
        CallInst call = new CallInst(basicBlockMap.getOrDefault(currentBlock, currentBlock), function,
                registerMap.getOrDefault(dst, dst), newParameterList);
        call.setPointer(registerMap.getOrDefault(pointer, pointer));
        return call;
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }

    @Override
    public void renameUsedRegisterSSA()
    {
        if ((pointer instanceof VirtualRegister) && (!(pointer instanceof GlobalVariable)))
            pointer = ((VirtualRegister) pointer).getSSARegister(((VirtualRegister) pointer).stack.peek());
        for (int i = 0; i < parameterList.size(); ++i)
        {
            Operand parameter = parameterList.get(i);
            if ((parameter instanceof VirtualRegister) && !(parameter instanceof GlobalVariable))
            {
                parameterList.set(i, ((VirtualRegister) parameter).getSSARegister(((VirtualRegister) parameter).stack.peek()));
            }
        }
        resolveUsedRegister();
    }

    @Override
    public void renameDstRegisterSSA()
    {
        if ((dst != null) && (dst instanceof VirtualRegister) && (!(dst instanceof GlobalVariable)))
        {
            dst = ((VirtualRegister) dst).getSSARegister(((VirtualRegister) dst).SSANewID());
        }
    }

//    @Override
//    public void calcDefUse()
//    {
//        used.clear();
//        def.clear();
//        if ((pointer instanceof VirtualRegister) && (!(pointer instanceof GlobalVariable))) used.add((VirtualRegister) pointer);
//        for (Operand parameter : parameterList)
//        {
//            if ((parameter instanceof VirtualRegister) && !(parameter instanceof GlobalVariable)) used.add((VirtualRegister) parameter);
//        }
//        if ((dst != null) && (dst instanceof VirtualRegister) && (!(dst instanceof GlobalVariable))) def.add((VirtualRegister) dst);
//        def.addAll(callerSaveVirtualRegisters);
//        def.remove(vrsp);
//    }
//
//    @Override
//    public void replaceUsed(VirtualRegister oldReg, VirtualRegister newReg)
//    {
//        if (pointer == oldReg) pointer = newReg;
//        for (int i = 0; i < parameterList.size(); i++)
//        {
//            Operand parameter = parameterList.get(i);
//            if (parameter == oldReg) parameterList.set(i, newReg);
//        }
//    }
//
//    @Override
//    public void replaceDef(VirtualRegister oldReg, VirtualRegister newReg)
//    {
//
//    }
}
