package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class StringTypeNode extends PrimitiveTypeNode
{
    public StringTypeNode(Position position)
    {
        super(position, "string");
    }
    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
