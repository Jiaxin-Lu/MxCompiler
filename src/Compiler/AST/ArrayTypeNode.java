package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class ArrayTypeNode extends TypeNode {
    private TypeNode arrayType;
    private int dims;
    public ArrayTypeNode(Position position, TypeNode typeNode)
    {
        super(position, typeNode.getTypeId());
        if (typeNode instanceof ArrayTypeNode)
        {
            this.arrayType = ((ArrayTypeNode) typeNode).arrayType;
            this.dims = ((ArrayTypeNode) typeNode).dims + 1;
        } else {
            this.arrayType = typeNode;
            this.dims = 1;
        }
    }

    public int getDims()
    {
        return dims;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
