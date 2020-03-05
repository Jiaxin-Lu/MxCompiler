package Compiler.AST;

import Compiler.Type.Symbol;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class IdExprNode extends ExprNode {
    private String id;
    private Symbol symbol;

    public IdExprNode(Position position, String id)
    {
        super(position);
        this.id = id;
    }

    public void setSymbol(Symbol symbol)
    {
        this.symbol = symbol;
    }

    public Symbol getSymbol()
    {
        return symbol;
    }

    public String getId()
    {
        return id;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
