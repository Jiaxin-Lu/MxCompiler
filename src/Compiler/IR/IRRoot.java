package Compiler.IR;

import Compiler.IR.Operand.*;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class IRRoot
{
    private Map<String, Function> functionMap = new LinkedHashMap<>();
    private Map<String, Function> builtinFunctions = new LinkedHashMap<>();
    private List<GlobalVariable> globalVariableList = new ArrayList<>();
    private List<StaticStr> staticStrList = new ArrayList<>();
    private List<StaticData> staticDataList = new ArrayList<>();


    //TODO: START WITH BUILTIN FUNCTIONS;

    public void addFunction(Function function)
    {
        functionMap.put(function.getName(), function);
    }

    public void removeFunction(Function function)
    {
        functionMap.remove(function.getName());
    }

    public void addStaticStr(StaticStr str)
    {
        staticStrList.add(str);
        staticDataList.add(str);
    }

    public void addStaticData(StaticData data)
    {
        staticDataList.add(data);
    }

    public void addGlobalVariable(GlobalVariable globalVariable)
    {
        globalVariableList.add(globalVariable);
    }

    public Map<String, Function> getFunctionMap()
    {
        return functionMap;
    }

    public Map<String, Function> getBuiltinFunctions()
    {
        return builtinFunctions;
    }

    public List<GlobalVariable> getGlobalVariableList()
    {
        return globalVariableList;
    }

    public List<StaticData> getStaticDataList()
    {
        return staticDataList;
    }

    public List<StaticStr> getStaticStrList()
    {
        return staticStrList;
    }
    //TODO: maybe something more when later!
}
