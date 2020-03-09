package Compiler.Type;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class ArraySymbol extends Symbol implements Type
{
    private int dims;
    public ArraySymbol(Type type, int dims)
    {
        super(type.getTypeName() + "array", type, null);
        this.dims = dims;
    }

    public Type getType()
    {
        return super.getType();
    }

    public int getDims()
    {
        return dims;
    }

    public void setDims(int dims)
    {
        this.dims = dims;
    }

    @Override
    public String getTypeName()
    {
        return super.getName();
    }

    public String getOriTypeName()
    {
        return super.getType().getTypeName();
    }

    @Override
    public void isCompatible(Position position, Type type) throws SemanticError //DONE: Check every array mistake!
    {
        if (!type.getTypeName().equals("null"))
        {
            if (type instanceof ArraySymbol)
            {
                super.getType().isCompatible(position, ((ArraySymbol) type).getType());
                if (dims != ((ArraySymbol)type).getDims())
                    throw new SemanticError(position, "Dimension doesn't match!");
            } else
                throw new SemanticError(position,
                        getTypeName() + " is not compatible with " + type.getTypeName() + "!");
        }
    }

    @Override
    public boolean isArrayType()
    {
        return true;
    }

    @Override
    public boolean isPointerType()
    {
        return true;
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

    @Override
    public boolean isClassType()
    {
        return false;
    }

    @Override
    public boolean isNullType()
    {
        return false;
    }
}
