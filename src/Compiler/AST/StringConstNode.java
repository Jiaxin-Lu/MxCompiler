package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class StringConstNode extends ConstExprNode {
    private String val;
    public StringConstNode(Position position, String val)
    {
        super(position);
        this.val = val;
    }

    public String getVal() {
        return val;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
