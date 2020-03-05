package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

import java.util.List;

public class BlockStmtNode extends StmtNode {
    private List<StmtNode> stmtList;
    public BlockStmtNode(Position position, List<StmtNode> stmtList)
    {
        super(position);
        this.stmtList = stmtList;
    }

    public BlockStmtNode(Position position, StmtNode stmtNode)
    {
        super(position);
        if (stmtNode != null) stmtList.add(stmtNode);
    }

    public List<StmtNode> getStmtList()
    {
        return stmtList;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
