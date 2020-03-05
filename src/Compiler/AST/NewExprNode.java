package Compiler.AST;

import Compiler.Type.Type;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

import java.util.ArrayList;
import java.util.List;

public class NewExprNode extends ExprNode {
    private TypeNode type;
    private int dims;
    private List<ExprNode> exprList = new ArrayList<ExprNode>();
    private Type typeResolved;

    public NewExprNode(Position position, TypeNode type, int dims, List<ExprNode> exprList)
    {
        super(position);
        this.type = type;
        this.dims = dims;
        this.exprList = exprList;
    }

    public TypeNode getType()
    {
        return type;
    }

    public int getDims()
    {
        return dims;
    }

    public List<ExprNode> getExprList()
    {
        return exprList;
    }

    public void setTypeResolved(Type typeResolved)
    {
        this.typeResolved = typeResolved;
    }

    public Type getTypeResolved()
    {
        return typeResolved;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
