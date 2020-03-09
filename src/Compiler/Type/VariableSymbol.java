package Compiler.Type;

import Compiler.AST.VarDeclNode;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class VariableSymbol extends Symbol implements Type
{
    private boolean unUsed = false;

    public VariableSymbol(String name, Type type, VarDeclNode varDeclNode)
    {
        super(name, type, varDeclNode);
    }

    @Override
    public boolean isVariableType()
    {
        return true;
    }

    @Override
    public String getTypeName()
    {
        return super.getName();
    }

    @Override
    public boolean isNullType()
    {
        return false;
    }

    @Override
    public boolean isClassType()
    {
        return false;
    }

    @Override
    public boolean isFunctionType()
    {
        return false;
    }

    @Override
    public boolean isPrimitiveType()
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
    public void isCompatible(Position position, Type type) throws SemanticError
    {

    }

    public void setUnUsed(boolean unUsed)
    {
        this.unUsed = unUsed;
    }

    public boolean isUnUsed()
    {
        return unUsed;
    }
}
