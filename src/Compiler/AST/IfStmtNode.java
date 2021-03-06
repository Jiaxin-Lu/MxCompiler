package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class IfStmtNode extends StmtNode {
    private ExprNode expr;
    private StmtNode thenStmt, elseStmt;
    public IfStmtNode(Position position, ExprNode expr, StmtNode thenStmt, StmtNode elseStmt)
    {
        super(position);
        this.expr = expr;
        this.thenStmt = thenStmt;
        this.elseStmt = elseStmt;
    }

    public ExprNode getExpr()
    {
        return expr;
    }

    public StmtNode getThenStmt()
    {
        return thenStmt;
    }

    public StmtNode getElseStmt()
    {
        return elseStmt;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
