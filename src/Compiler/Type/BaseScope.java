package Compiler.Type;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

import java.util.LinkedHashMap;
import java.util.Map;

public class BaseScope implements Scope
{
    private String name;
    private Scope fatherScope;
    public Map<String, Symbol> symbolMap = new LinkedHashMap<>();

    public BaseScope(String name, Scope fatherScope)
    {
        this.name = name;
        this.fatherScope = fatherScope;
    }

    @Override
    public String getScopeName()
    {
        return name;
    }

    @Override
    public Scope getFatherScope()
    {
        return fatherScope;
    }

    @Override
    public void defineClass(ClassSymbol obj) throws SemanticError
    {

    }

    @Override
    public void defineVariable(VariableSymbol obj) throws SemanticError
    {
        if (symbolMap.containsKey(obj.getName()))
            throw new SemanticError(obj.getOrigin().getPosition(), "Duplicate id!");
        symbolMap.put(obj.getName(), obj);
        obj.setScope(this);
    }

    @Override
    public Symbol resolveSymbol(Position position, String id) throws SemanticError
    {
        return null;
    }

    @Override
    public void defineFunction(FunctionSymbol obj) throws SemanticError
    {
        if (symbolMap.containsKey(obj.getName()))
            throw new SemanticError(obj.getOrigin().getPosition(), "Duplicate id!");
        obj.setScope(this);
        symbolMap.put(obj.getName(), obj);
    }

}
