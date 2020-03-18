package Compiler.AST;

import Compiler.IR.BasicBlock;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class ForStmtNode extends StmtNode implements LoopStmtNode {
    private ExprNode init, cond, step;
    private StmtNode statement;

    //IR
    private BasicBlock stepBlock;
    private BasicBlock mergedBlock;

    public ForStmtNode(Position position, ExprNode init, ExprNode cond, ExprNode step, StmtNode statement)
    {
        super(position);
        this.init = init;
        this.cond = cond;
        this.step = step;
        this.statement = statement;
    }

    public ExprNode getInit()
    {
        return init;
    }

    public ExprNode getCond()
    {
        return cond;
    }

    public ExprNode getStep()
    {
        return step;
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
    public BasicBlock getMergedBlock()
    {
        return mergedBlock;
    }

    @Override
    public BasicBlock getStepBlock()
    {
        return stepBlock;
    }
}
