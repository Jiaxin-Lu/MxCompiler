package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class BoolTypeNode extends PrimitiveTypeNode
{
    public BoolTypeNode(Position position)
    {
        super(position, "bool");
    }
    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
