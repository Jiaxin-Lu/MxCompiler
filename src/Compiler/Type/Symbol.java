package Compiler.Type;

import Compiler.AST.ASTNode;

public class Symbol
{
    private String name;
    private Type type;
    private Scope scope;
    private ASTNode origin;

    public Symbol(String name, Type type, ASTNode origin)
    {
        this.name = name;
        this.type = type;
        this.origin = origin;
    }

    public String getName()
    {
        return name;
    }

    public ASTNode getOrigin()
    {
        return origin;
    }

    public Type getType()
    {
        return type;
    }

    public void setType(Type type)
    {
        this.type = type;
    }

    public Scope getScope()
    {
        return scope;
    }

    public void setScope(Scope scope)
    {
        this.scope = scope;
    }
}
