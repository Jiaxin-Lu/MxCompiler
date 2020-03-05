package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class BoolConstNode extends ConstExprNode {
    private boolean val;
    public BoolConstNode(Position position, boolean val)
    {
        super(position);
        this.val = val;
    }

    public boolean getVal()
    {
        return val;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
