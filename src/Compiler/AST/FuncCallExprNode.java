package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

import java.util.List;

public class FuncCallExprNode extends ExprNode {
    private ExprNode function;
    private List<ExprNode> parameterList;
    public FuncCallExprNode(Position position, ExprNode function, List<ExprNode> parameterList)
    {
        super(position);
        this.function = function;
        this.parameterList = parameterList;
    }

    public ExprNode getFunction()
    {
        return function;
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
