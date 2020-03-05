package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class UnaryExprNode extends ExprNode {
    public enum Op
    {
        ADDP, ADDS, SUBP, SUBS, NOT, NOTI, NEG, POS
    }
    private Op op;
    private ExprNode expr;
    public UnaryExprNode(Position position, Op op, ExprNode expr)
    {
        super(position);
        this.op = op;
        this.expr = expr;
    }

    public ExprNode getExpr()
    {
        return expr;
    }

    public Op getOp()
    {
        return op;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
