package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

import java.util.List;

public class ProgramNode extends ASTNode
{
    private List<ProgramDeclNode> programDeclNodeList;

    public ProgramNode(Position position, List<ProgramDeclNode> programDeclNodeList)
    {
        super(position);
        this.programDeclNodeList = programDeclNodeList;
    }

    public List<ProgramDeclNode> getProgramDeclNodeList() {
        return programDeclNodeList;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}