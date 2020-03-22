package Compiler.AST;

import Compiler.IR.BasicBlock;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class WhileStmtNode extends LoopStmtNode {
    private ExprNode expr;
    private StmtNode statement;

    //IR
    private BasicBlock stepBlock;
    private BasicBlock mergedBlock;

    public WhileStmtNode(Position position, ExprNode expr, StmtNode statement)
    {
        super(position);
        this.expr = expr;
        this.statement = statement;
    }

    public ExprNode getExpr()
    {
        return expr;
    }

    public StmtNode getStatement()
    {
        return statement;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }

    public void setMergedBlock(BasicBlock mergedBlock)
    {
        this.mergedBlock = mergedBlock;
    }

    public void setStepBlock(BasicBlock stepBlock)
    {
        this.stepBlock = stepBlock;
    }

    @Override
    public BasicBlock getStepBlock()
    {
        return stepBlock;
    }

    @Override
    public BasicBlock getMergedBlock()
    {
        return mergedBlock;
    }
}
