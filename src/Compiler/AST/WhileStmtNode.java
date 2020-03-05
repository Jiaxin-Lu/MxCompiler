package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class WhileStmtNode extends StmtNode implements LoopStmtNode {
    private ExprNode expr;
    private StmtNode statement;
    public WhileStmtNode(Position position, ExprNode expr, StmtNode statement)
    {
        super(position);
        this.expr = expr;
        this.statement = statement;
    }

    public ExprNode getExpr()
    {
        return expr;
    }

    public StmtNode getStatement()
    {
        return statement;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
