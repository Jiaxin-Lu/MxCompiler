package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class ExprStmtNode extends StmtNode {
    private ExprNode expr;
    public ExprStmtNode(Position position, ExprNode expr)
    {
        super(position);
        this.expr = expr;
    }

    public ExprNode getExpr()
    {
        return expr;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
