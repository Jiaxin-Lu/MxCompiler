package Compiler.AST;

import Compiler.IR.BasicBlock;

public interface LoopStmtNode{
    BasicBlock getMergedBlock();

    BasicBlock getStepBlock();
}
