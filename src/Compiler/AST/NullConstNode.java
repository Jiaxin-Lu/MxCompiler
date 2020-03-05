package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class NullConstNode extends ConstExprNode {
    public NullConstNode(Position position)
    {
        super(position);
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
