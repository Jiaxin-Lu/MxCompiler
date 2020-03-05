package Compiler.AST;

import Compiler.Type.FunctionSymbol;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class ReturnStmtNode extends StmtNode{
    private ExprNode expr;
    private FunctionSymbol currentFunction;

    public ReturnStmtNode(Position position, ExprNode expr)
    {
        super(position);
        this.expr = expr;
    }

    public ExprNode getExpr()
    {
        return expr;
    }

    public void setCurrentFunction(FunctionSymbol currentFunction)
    {
        this.currentFunction = currentFunction;
    }

    public FunctionSymbol getCurrentFunction()
    {
        return currentFunction;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
