package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class BinaryExprNode extends ExprNode {
    public enum Op
    {
        MUL, DIV, MOD, ADD, SUB, SHL, SHR, LEQ, REQ, LT, RT, EQ, NEQ, AND, XOR, OR, ANDI, ORI, ASS
    }

    private Op op;
    private ExprNode lhs, rhs;

    public BinaryExprNode(Position position, Op op, ExprNode lhs, ExprNode rhs)
    {
        super(position);
        this.op = op;
        this.lhs = lhs;
        this.rhs = rhs;
    }

    public ExprNode getLhs()
    {
        return lhs;
    }

    public ExprNode getRhs()
    {
        return rhs;
    }

    public Op getOp()
    {
        return op;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
