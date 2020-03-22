package Compiler.AST;

import Compiler.IR.BasicBlock;
import Compiler.Utils.Position;

public abstract class LoopStmtNode extends StmtNode{
    public LoopStmtNode(Position position)
    {
        super(position);
    }
    public abstract BasicBlock getMergedBlock();

    public abstract BasicBlock getStepBlock();
}
