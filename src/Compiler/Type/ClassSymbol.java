package Compiler.Type;

import Compiler.AST.ClassDeclNode;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

import java.util.LinkedHashMap;
import java.util.Map;

public class ClassSymbol extends Symbol implements Type, Scope
{
    private Scope fatherScope;
    private FunctionSymbol constructor;
    private Map<String, VariableSymbol> variableTypeMap = new LinkedHashMap<>();
    private Map<String, FunctionSymbol> functionTypeMap = new LinkedHashMap<>();

    public ClassSymbol(String name, ClassDeclNode classDeclNode, Scope fatherScope)
    {
        super(name, null, classDeclNode);
        this.fatherScope = fatherScope;
    }

    public void setConstructor(FunctionSymbol constructor)
    {
        this.constructor = constructor;
    }

    public FunctionSymbol getConstructor()
    {
        return constructor;
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
        if (variableTypeMap.containsKey(obj.getName()) || functionTypeMap.containsKey(obj.getName()))
            throw new SemanticError(obj.getOrigin().getPosition(), "Duplicate id!");
        variableTypeMap.put(obj.getName(), obj);
        obj.setScope(this);
    }

    @Override
    public void defineFunction(FunctionSymbol obj) throws SemanticError
    {
        if (variableTypeMap.containsKey(obj.getName()) || functionTypeMap.containsKey(obj.getName()))
            throw new SemanticError(obj.getOrigin().getPosition(), "Duplicate id!");
        obj.setScope(this);
        functionTypeMap.put(obj.getName(), obj);
    }

    @Override
    public void defineClass(ClassSymbol obj)
    {
    }

    @Override
    public Symbol resolveSymbol(Position position, String id) throws SemanticError
    {
        Symbol variableType = variableTypeMap.get(id);
        if (variableType != null) return variableType;
        Symbol functionType = functionTypeMap.get(id);
        if (functionType != null) return functionType;
        return fatherScope.resolveSymbol(position, id);
    }

    public Symbol resolveMember(Position position, String id) throws SemanticError
    {
        Symbol variableType = variableTypeMap.get(id);
        if (variableType != null) return variableType;
        Symbol functionType = functionTypeMap.get(id);
        if (functionType != null) return functionType;
        throw new SemanticError(position, "Member " + id + " can't find!");
    }

    //Type

    @Override
    public void isCompatible(Position position, Type type) throws SemanticError
    {
        if (getTypeName().equals("string"))
        {
            if (!type.getTypeName().equals("string"))
                throw new SemanticError(position, "String is not compatible with " + type.getTypeName() + "!");
        } else
        {
            if (type.getTypeName().equals("null") || type.getTypeName().equals(getTypeName()))
            {

            } else
                throw new SemanticError(position, getTypeName() + " is not compatible with " + type.getTypeName() + "!");
        }
    }

    @Override
    public String getTypeName()
    {
        return super.getName();
    }

    @Override
    public boolean isClassType()
    {
        return true;
    }

    @Override
    public boolean isPointerType()
    {
        return true;
    }

    @Override
    public boolean isArrayType()
    {
        return false;
    }

    @Override
    public boolean isNullType()
    {
        return false;
    }

    @Override
    public boolean isVariableType()
    {
        return false;
    }

    @Override
    public boolean isPrimitiveType()
    {
        return false;
    }

    @Override
    public boolean isFunctionType()
    {
        return false;
    }
}
