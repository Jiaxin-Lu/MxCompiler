package Compiler.Type;

import Compiler.AST.FuncDeclNode;
import Compiler.IR.Function;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

import java.util.LinkedHashMap;
import java.util.Map;

public class FunctionSymbol extends Symbol implements Scope, Type
{
    private Scope fatherScope;
    private Map<String, VariableSymbol> arguments = new LinkedHashMap<>();

    //IR
    private Function function;
    private boolean isMemberFunction = false;

    public FunctionSymbol(String name, Type type, FuncDeclNode funcDeclNode, Scope fatherScope)
    {
        super(name, type, funcDeclNode);
        this.fatherScope = fatherScope;
    }

    public Map<String, VariableSymbol> getArguments()
    {
        return arguments;
    }

    //IR
    public void setFunction(Function function)
    {
        this.function = function;
    }

    public Function getFunction()
    {
        return function;
    }

    public boolean isMemberFunction()
    {
        return isMemberFunction;
    }

    public void setMemberFunction()
    {
        isMemberFunction = true;
    }

    // Scope
    @Override
    public String getScopeName()
    {
        return super.getName();
    }

    @Override
    public Scope getFatherScope()
    {
        return fatherScope;
    }

    @Override
    public void defineVariable(VariableSymbol obj) throws SemanticError
    {
        if (arguments.containsKey(obj.getName()))
            throw new SemanticError(obj.getOrigin().getPosition(), "duplicate variables");
        else arguments.put(obj.getName(), obj);
        obj.setScope(this);
    }

    @Override
    public void defineFunction(FunctionSymbol obj)
    {

    }

    @Override
    public void defineClass(ClassSymbol obj)
    {

    }

    @Override
    public Symbol resolveSymbol(Position position, String id) throws SemanticError
    {
        Symbol obj = arguments.get(id);
        if (obj != null) return obj;
        else return fatherScope.resolveSymbol(position, id);
    }

    //Type
    @Override
    public String getTypeName()
    {
        return super.getName();
    }

    @Override
    public boolean isFunctionType()
    {
        return true;
    }

    @Override
    public void isCompatible(Position position, Type type)
    {

    }

    @Override
    public boolean isPrimitiveType()
    {
        return false;
    }

    @Override
    public boolean isVariableType()
    {
        return false;
    }

    @Override
    public boolean isNullType()
    {
        return false;
    }

    @Override
    public boolean isPointerType()
    {
        return false;
    }

    @Override
    public boolean isArrayType()
    {
        return false;
    }

    @Override
    public boolean isClassType()
    {
        return false;
    }
}
