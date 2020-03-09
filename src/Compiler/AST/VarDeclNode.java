package Compiler.AST;

import Compiler.Type.*;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class VarDeclNode extends ProgramDeclNode
{
    private TypeNode type;
    private String id;
    private ExprNode expr;
    private Type typeResolved;

    private VariableSymbol variableSymbol;
    private boolean isGlobalVar = false;
    private boolean isPrimitiveVar = false;

    public VarDeclNode(Position position, TypeNode type, String id, ExprNode expr)
    {
        super(position);
        this.type = type;
        this.id = id;
        this.expr = expr;
    }

    public TypeNode getType()
    {
        return type;
    }

    public String getId()
    {
        return id;
    }

    public ExprNode getExpr()
    {
        return expr;
    }

    public void setExpr(ExprNode expr)
    {
        this.expr = expr;
    }

    public void setType(TypeNode type)
    {
        this.type = type;
    }

    public void setTypeResolved(Type typeResolved)
    {
        this.typeResolved = typeResolved;
    }

    public Type getTypeResolved()
    {
        return typeResolved;
    }

    public VariableSymbol getVariableSymbol()
    {
        return variableSymbol;
    }

    public void setVariableSymbol(VariableSymbol variableSymbol)
    {
        this.variableSymbol = variableSymbol;
    }

    public void setGlobalVar()
    {
        isGlobalVar = true;
    }

    public boolean isGlobalVar()
    {
        return isGlobalVar;
    }

    public void setPrimitiveVar()
    {
        isPrimitiveVar = true;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}