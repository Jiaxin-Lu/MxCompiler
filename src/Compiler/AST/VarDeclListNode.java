package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

import java.util.ArrayList;
import java.util.List;

public class VarDeclListNode extends ProgramDeclNode{
    private List<VarDeclNode> varDeclList;
    public VarDeclListNode(Position position, List<VarDeclNode> varDeclList)
    {
        super(position);
        this.varDeclList = varDeclList;
    }
    public VarDeclListNode(Position position)
    {
        super(position);
        this.varDeclList = new ArrayList<>();
    }

    public List<VarDeclNode> getVarDeclList()
    {
        return varDeclList;
    }
    public void addVar(VarDeclNode varDeclNode)
    {
        varDeclList.add(varDeclNode);
    }
    public void setType(TypeNode type)
    {
        for (VarDeclNode decl : varDeclList)
        {
            decl.setType(type);
        }
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}