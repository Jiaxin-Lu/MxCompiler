package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public abstract class ASTNode
{
    private Position position;

    public ASTNode(Position position)
    {
        this.position = position;
    }

    public Position getPosition() {
        return position;
    }
    abstract public void accept(ASTVisitor visitor) throws SemanticError;
}