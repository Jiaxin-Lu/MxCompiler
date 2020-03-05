package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class IntConstNode extends ConstExprNode {
    private int val;
    public IntConstNode(Position position, int val)
    {
        super(position);
        this.val = val;
    }

    public int getVal() {
        return val;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
