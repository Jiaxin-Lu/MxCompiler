package Compiler.AST;

import Compiler.Type.Scope;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class ThisExprNode extends ExprNode {
    private Scope scope;
    public ThisExprNode(Position position)
    {
        super(position);
    }

    public void setScope(Scope scope)
    {
        this.scope = scope;
    }

    public Scope getScope()
    {
        return scope;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
