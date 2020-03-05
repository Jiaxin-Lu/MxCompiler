package Compiler.AST;

import Compiler.Utils.Position;

public abstract class TypeNode extends ASTNode
{
    private String typeId;
    public TypeNode(Position position, String typeId)
    {
        super(position);
        this.typeId = typeId;
    }

    public String getTypeId()
    {
        return typeId;
    }
}
