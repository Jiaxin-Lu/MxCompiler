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
    private Map<Register, String> staticStringValMap = new LinkedHashMap<>();

    public Function builtinPrint = new Function("print", "__builtin_print");
    public Function builtinPrintln = new Function("println", "__builtin_println");
    public Function builtinPrintInt = new Function("printInt", "__builtin_printInt");
    public Function builtinPrintlnInt = new Function("printlnInt", "__builtin_printlnInt");
    public Function builtinGetString = new Function("getString", "__builtin_getString");
    public Function builtinGetInt = new Function("getInt", "__builtin_getInt");
    public Function builtinToString = new Function("toString", "__builtin_toString");

    public Function builtinStringLength = new Function("string.length", "__builtin_string_length");
    public Function builtinStringSubstring = new Function("string.substring", "__builtin_string_substring");
    public Function builtinStringParseInt = new Function("string.parseInt", "__builtin_string_parseInt");
    public Function builtinStringOrd = new Function("string.ord", "__builtin_string_ord");
    public Function builtinArraySize = new Function("array.size", "__builtin_array_size");

    public Function builtinStringAdd = new Function("string.add", "__builtin_string_add");
    public Function builtinStringLT = new Function("string.lt", "__builtin_string_lt");
    public Function builtinStringLEQ = new Function("string.leq", "__builtin_string_leq");
    public Function builtinStringEQ = new Function("string.eq", "__builtin_string_eq");
    public Function builtinStringNEQ = new Function("string.neq", "__builtin_string_neq");
    public Function builtinStringREQ = new Function("string.req", "__builtin_string_req");
    public Function builtinStringRT = new Function("string.rt", "__builtin_string_rt");

    public IRRoot()
    {
        addBuiltinFunction(builtinPrint);
        addBuiltinFunction(builtinPrintln);
        addBuiltinFunction(builtinPrintInt);
        addBuiltinFunction(builtinPrintlnInt);
        addBuiltinFunction(builtinGetString);
        addBuiltinFunction(builtinGetInt);
        addBuiltinFunction(builtinToString);

        addBuiltinFunction(builtinStringLength);
        addBuiltinFunction(builtinStringSubstring);
        addBuiltinFunction(builtinStringParseInt);
        addBuiltinFunction(builtinStringOrd);
//        addBuiltinFunction(builtinArraySize);

        addBuiltinFunction(builtinStringAdd);
        addBuiltinFunction(builtinStringLT);
        addBuiltinFunction(builtinStringLEQ);
        addBuiltinFunction(builtinStringEQ);
        addBuiltinFunction(builtinStringNEQ);
        addBuiltinFunction(builtinStringREQ);
        addBuiltinFunction(builtinStringRT);
    }

    //DONE: START WITH BUILTIN FUNCTIONS;

    public void addBuiltinFunction(Function function)
    {
        builtinFunctions.put(function.getName(), function);
    }

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

    public void addStaticStringVal(Register base, String str)
    {
        staticStringValMap.put(base, str);
    }

    public Map<Register, String> getStaticStringValMap()
    {
        return staticStringValMap;
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
