package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class ArrayExprNode extends ExprNode
{
    private ExprNode array, index;

    public ArrayExprNode(Position position, ExprNode array, ExprNode index)
    {
        super(position);
        this.array = array;
        this.index = index;
    }

    public ExprNode getArray()
    {
        return array;
    }

    public ExprNode getIndex()
    {
        return index;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
