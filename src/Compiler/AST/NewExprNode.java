package Compiler.AST;

import Compiler.Type.Type;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

import java.util.ArrayList;
import java.util.List;

public class NewExprNode extends ExprNode {
    private TypeNode baseType;
    private int dims;
    private List<ExprNode> exprList = new ArrayList<ExprNode>();
    private Type baseTypeResolved;

    public NewExprNode(Position position, TypeNode type, int dims, List<ExprNode> exprList)
    {
        super(position);
        this.baseType = type;
        this.dims = dims;
        this.exprList = exprList;
    }

    public TypeNode getBaseType()
    {
        return baseType;
    }

    public int getDims()
    {
        return dims;
    }

    public List<ExprNode> getExprList()
    {
        return exprList;
    }

    public void setBaseTypeResolved(Type baseTypeResolved)
    {
        this.baseTypeResolved = baseTypeResolved;
    }

    public Type getBaseTypeResolved()
    {
        return baseTypeResolved;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
