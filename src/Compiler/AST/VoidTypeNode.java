package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class VoidTypeNode extends PrimitiveTypeNode
{

    public VoidTypeNode(Position position)
    {
        super(position, "void");
    }
    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
