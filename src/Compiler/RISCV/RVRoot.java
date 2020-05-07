package Compiler.RISCV;


import Compiler.RISCV.RVOperand.GlobalVariable;
import Compiler.RISCV.RVOperand.StaticStr;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class RVRoot
{
    private Map<String, RVFunction> functionMap = new LinkedHashMap<>();
    private List<GlobalVariable> globalVariableList = new ArrayList<>();
    private List<StaticStr> staticStrList = new ArrayList<>();

    public RVRoot()
    {
    }

    public Map<String, RVFunction> getFunctionMap()
    {
        return functionMap;
    }

    public List<GlobalVariable> getGlobalVariableList()
    {
        return globalVariableList;
    }

    public List<StaticStr> getStaticStrList()
    {
        return staticStrList;
    }

    public void addFunction(RVFunction function)
    {
        functionMap.put(function.getName(), function);
    }

    public void addStaticStr(StaticStr str)
    {
        staticStrList.add(str);
    }
    public void addGlobalVariable(GlobalVariable globalVariable)
    {
        globalVariableList.add(globalVariable);
    }

    public void accept(RVVisitor visitor)
    {
        visitor.visit(this);
    }
}
