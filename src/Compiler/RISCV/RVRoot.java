package Compiler.RISCV;


import Compiler.IR.Function;
import Compiler.RISCV.RVOperand.RVGlobalVariable;
import Compiler.RISCV.RVOperand.RVStaticStr;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class RVRoot
{
    private Map<String, RVFunction> functionMap = new LinkedHashMap<>();
    private Map<String, RVFunction> builtinFunctionMap = new LinkedHashMap<>();
    private List<RVGlobalVariable> globalVariableList = new ArrayList<>();
    private List<RVStaticStr> staticStrList = new ArrayList<>();

    public RVFunction rvMalloc = new RVFunction("malloc");

    public RVRoot()
    {
    }

    public Map<String, RVFunction> getFunctionMap()
    {
        return functionMap;
    }

    public List<RVGlobalVariable> getGlobalVariableList()
    {
        return globalVariableList;
    }

    public List<RVStaticStr> getStaticStrList()
    {
        return staticStrList;
    }

    public void addFunction(RVFunction function)
    {
        functionMap.put(function.getName(), function);
    }

    public void addBuiltinFunction(RVFunction function)
    {
        builtinFunctionMap.put(function.getName(), function);
    }

    public void addStaticStr(RVStaticStr str)
    {
        staticStrList.add(str);
    }
    public void addGlobalVariable(RVGlobalVariable RVGlobalVariable)
    {
        globalVariableList.add(RVGlobalVariable);
    }

    public void accept(RVVisitor visitor)
    {
        visitor.visit(this);
    }
}
