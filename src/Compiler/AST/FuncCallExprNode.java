package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

import java.util.List;

public class FuncCallExprNode extends ExprNode {
    private ExprNode functionExpr;
    private List<ExprNode> parameterList;
    public FuncCallExprNode(Position position, ExprNode functionExpr, List<ExprNode> parameterList)
    {
        super(position);
        this.functionExpr = functionExpr;
        this.parameterList = parameterList;
    }

    public ExprNode getFunctionExpr()
    {
        return functionExpr;
    }

    public List<ExprNode> getParameterList()
    {
        return parameterList;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
