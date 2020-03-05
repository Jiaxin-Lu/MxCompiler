package Compiler.Type;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class PrimitiveTypeSymbol extends Symbol implements Type
{
    public PrimitiveTypeSymbol(String name)
    {
        super(name, null, null);
    }

    @Override
    public String getTypeName()
    {
        return super.getName();
    }

    @Override
    public boolean isPrimitiveType()
    {
        return true;
    }

    @Override
    public void isCompatible(Position position, Type type) throws SemanticError
    {
        if (!type.getTypeName().equals("void"))
        {
            if (!getTypeName().equals(type.getTypeName()))
                throw new SemanticError(position, getTypeName() + "is not compatible with " + type.getTypeName() + "!");
        } else
            throw new SemanticError(position, "Void type can't be on the right hand side!");
    }

    @Override
    public boolean isVariableType()
    {
        return false;
    }

    @Override
    public boolean isClassType()
    {
        return false;
    }

    @Override
    public boolean isArrayType()
    {
        return false;
    }

    @Override
    public boolean isPointerType()
    {
        return false;
    }

    @Override
    public boolean isFunctionType()
    {
        return false;
    }

    @Override
    public boolean isNullType()
    {
        return false;
    }
}
