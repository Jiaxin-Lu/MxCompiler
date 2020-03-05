package Compiler.AST;

import Compiler.Type.ClassSymbol;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

import java.util.List;

public class ClassDeclNode extends ProgramDeclNode
{
    private String id;
    private List<FuncDeclNode> funcDeclList;
    private List<VarDeclNode> varDeclList;
    private FuncDeclNode constructorDecl;
    private ClassSymbol classSymbol;

    public ClassDeclNode(Position position, String id, List<FuncDeclNode> funcDeclList,
                         List<VarDeclNode> varDeclList, FuncDeclNode constructorDecl)
    {
        super(position);
        this.id = id;
        this.funcDeclList = funcDeclList;
        this.varDeclList = varDeclList;
        this.constructorDecl = constructorDecl;
    }

    public String getId()
    {
        return id;
    }

    public List<FuncDeclNode> getFuncDeclList()
    {
        return funcDeclList;
    }

    public List<VarDeclNode> getVarDeclList()
    {
        return varDeclList;
    }

    public void setClassSymbol(ClassSymbol classSymbol)
    {
        this.classSymbol = classSymbol;
    }

    public ClassSymbol getClassSymbol()
    {
        return classSymbol;
    }

    public FuncDeclNode getConstructorDecl()
    {
        return constructorDecl;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}