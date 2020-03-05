package Compiler.Type;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class NullType implements Type
{
    public NullType()
    {
    }

    @Override
    public String getTypeName()
    {
        return "null";
    }

    @Override
    public boolean isNullType()
    {
        return true;
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

    @Override
    public boolean isFunctionType()
    {
        return false;
    }

    @Override
    public boolean isPointerType()
    {
        return true;
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
    public void isCompatible(Position position, Type type) throws SemanticError
    {
        throw new SemanticError(position, "Null cannot be assigned!");
    }
}
