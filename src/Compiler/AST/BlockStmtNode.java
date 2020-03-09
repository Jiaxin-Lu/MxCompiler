package Compiler.AST;

import Compiler.Type.Scope;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

import java.util.ArrayList;
import java.util.List;

public class BlockStmtNode extends StmtNode {
    private List<StmtNode> stmtList = new ArrayList<>();

    private Scope blockScope;

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

    public Scope getBlockScope()
    {
        return blockScope;
    }

    public void setBlockScope(Scope blockScope)
    {
        this.blockScope = blockScope;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
