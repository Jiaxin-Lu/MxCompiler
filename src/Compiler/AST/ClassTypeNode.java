package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class ClassTypeNode extends TypeNode
{
    private String id;
    public ClassTypeNode(Position position, String id)
    {
        super(position, id);
        this.id = id;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
