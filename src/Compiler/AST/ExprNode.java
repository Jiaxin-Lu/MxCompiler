package Compiler.AST;

import Compiler.Type.FunctionSymbol;
import Compiler.Type.Type;
import Compiler.Utils.Position;

public abstract class ExprNode extends ASTNode {
    public enum ExprType
    {
        LEFT, RIGHT, CLASS, FUNCTION
    }

    private ExprType exprType;
    private Type typeResolved;
    private FunctionSymbol functionSymbol;

    public ExprNode(Position position)
    {
        super(position);
    }

    public void setExprType(ExprType exprType)
    {
        this.exprType = exprType;
    }

    public ExprType getExprType()
    {
        return exprType;
    }

    public void setTypeResolved(Type typeResolved)
    {
        this.typeResolved = typeResolved;
    }

    public Type getTypeResolved()
    {
        return typeResolved;
    }

    public void setFunctionSymbol(FunctionSymbol functionSymbol)
    {
        this.functionSymbol = functionSymbol;
    }

    public FunctionSymbol getFunctionSymbol()
    {
        return functionSymbol;
    }

    public boolean isString()
    {
        return ((exprType == ExprType.LEFT || exprType == ExprType.RIGHT) && typeResolved.getTypeName().equals("string"));
    }

    public boolean isInt()
    {
        return ((exprType == ExprType.LEFT || exprType == ExprType.RIGHT) && typeResolved.getTypeName().equals("int"));
    }

    public boolean isBool()
    {
        return ((exprType == ExprType.LEFT || exprType == ExprType.RIGHT) && typeResolved.getTypeName().equals("bool"));
    }

    public boolean isNull()
    {
        return typeResolved.isNullType();
    }

    public boolean isVal()
    {
        return (exprType != ExprType.CLASS && exprType != ExprType.FUNCTION);
    }
    public boolean isIntVariable()
    {
        return (exprType == ExprType.LEFT && typeResolved.getTypeName().equals("int"));
    }

    public boolean isBoolVariable()
    {
        return (exprType == ExprType.LEFT && typeResolved.getTypeName().equals("bool"));
    }

    public boolean canCall()
    {
        return (exprType == ExprType.FUNCTION);
    }

    public boolean canAssign()
    {
        return (exprType == ExprType.LEFT);
    }

    public boolean canAccess()
    {
        return (typeResolved.isClassType() && isVal());
    }

    public boolean canNull()
    {
        return ((exprType == ExprType.LEFT) &&
                (typeResolved.isClassType() || typeResolved.isArrayType() || typeResolved.isNullType()));
    }
}
