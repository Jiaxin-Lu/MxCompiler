package Compiler.AST;

import Compiler.Type.Symbol;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class MemberExprNode extends ExprNode
{
    private ExprNode expr;
    private String id;
    private Symbol member;

    public MemberExprNode(Position position, ExprNode expr, String id)
    {
        super(position);
        this.expr = expr;
        this.id = id;
    }

    public ExprNode getExpr()
    {
        return expr;
    }

    public String getId()
    {
        return id;
    }

    public void setMember(Symbol member)
    {
        this.member = member;
    }

    public Symbol getMember()
    {
        return member;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
