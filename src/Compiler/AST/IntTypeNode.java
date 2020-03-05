package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class IntTypeNode extends PrimitiveTypeNode
{

    public IntTypeNode(Position position)
    {
        super(position, "int");
    }
    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
