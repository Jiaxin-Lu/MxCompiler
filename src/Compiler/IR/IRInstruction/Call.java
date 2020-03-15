package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class Call extends IRInstruction
{
    private Function function;
    private List<Operand> parameterList = new LinkedList<>();
    private Operand dst;

    public Call(BasicBlock basicBlock, Function function, List<Operand> parameterList, Operand dst)
    {
        super(basicBlock);
        this.function = function;
        this.parameterList = parameterList;
        this.dst = dst;
        resolveUsedRegister();
    }

    public void addParameterList(Operand operand)
    {
        parameterList.add(operand);
        resolveUsedRegister();
    }

    public List<Operand> getParameterList()
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

    @Override
    public Register getOriginRegister()
    {
        return (Register) dst;
    }

    @Override
    public void setOriginRegister(Register register)
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
    }

    @Override
    public void setUsedRegister(Map<Register, Register> registerMap)
    {
        for (int i = 0; i < parameterList.size(); ++i)
        {
            Operand parameter = parameterList.get(i);
            if (parameter instanceof Register) parameterList.set(i, registerMap.get(parameter));
        }
        resolveUsedRegister();
    }

    @Override
    public IRInstruction copyInst(Map<BasicBlock, BasicBlock> basicBlockMap, Map<Operand, Operand> registerMap)
    {
        List<Operand> newParameterList = new LinkedList<>();
        for (Operand parameter : parameterList)
        {
            newParameterList.add(registerMap.getOrDefault(parameter, parameter));
        }
        return new Call(basicBlockMap.getOrDefault(currentBlock, currentBlock), function, newParameterList,
                registerMap.getOrDefault(dst, dst));
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
