package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class VarDeclStmtNode extends StmtNode {
    private VarDeclListNode varDeclList;
    public VarDeclStmtNode(Position position, VarDeclListNode varDeclList)
    {
        super(position);
        this.varDeclList = varDeclList;
    }

    public VarDeclListNode getVarDeclList()
    {
        return varDeclList;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}
