package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class ContinueStmtNode extends StmtNode {
    private LoopStmtNode loop;
    public ContinueStmtNode(Position position)
    {
        super(position);
    }

    public LoopStmtNode getLoop()
    {
        return loop;
    }

    public void setLoop(LoopStmtNode loop)
    {
        this.loop = loop;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
