package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Type.*;
import Compiler.Utils.SemanticError;

public class ClassInitializer implements ASTVisitor
{
    private GlobalScope globalScope;
    private Scope currentScope;

    public ClassInitializer(GlobalScope globalScope)
    {
        this.globalScope = globalScope;
    }

    @Override
    public void visit(ProgramNode node) throws SemanticError
    {
        for (ProgramDeclNode programDeclNode : node.getProgramDeclNodeList()) {
            programDeclNode.accept(this);
        }
    }

    //Decl
    @Override
    public void visit(VarDeclNode node) throws SemanticError
    {
    }

    @Override
    public void visit(ClassDeclNode node) throws SemanticError
    {
        ClassSymbol classSymbol = new ClassSymbol(node.getId(),node,globalScope);
        globalScope.defineClass(classSymbol);
//        if (classSymbol.getTypeName().equals("A"))
//        {
//            System.out.println("get A");
//        }
        node.setClassSymbol(classSymbol);
    }

    @Override
    public void visit(FuncDeclNode node) throws SemanticError
    {
    }

    @Override
    public void visit(VarDeclListNode node) throws SemanticError
    {
    }

    //Type
    @Override
    public void visit(ArrayTypeNode node) throws SemanticError
    {
    }

    @Override
    public void visit(VoidTypeNode node) throws SemanticError
    {
    }

    @Override
    public void visit(IntTypeNode node) throws SemanticError
    {
    }

    @Override
    public void visit(BoolTypeNode node) throws SemanticError
    {
    }

    @Override
    public void visit(StringTypeNode node) throws SemanticError
    {
    }

    @Override
    public void visit(ClassTypeNode node) throws SemanticError
    {
    }

    //Stmt
    @Override
    public void visit(BlockStmtNode node) throws SemanticError
    {
    }

    @Override
    public void visit(VarDeclStmtNode node) throws SemanticError
    {
    }

    @Override
    public void visit(ExprStmtNode node) throws SemanticError
    {
    }

    @Override
    public void visit(IfStmtNode node) throws SemanticError
    {
    }

    @Override
    public void visit(ReturnStmtNode node) throws SemanticError
    {
    }

    @Override
    public void visit(BreakStmtNode node) throws SemanticError
    {
    }

    @Override
    public void visit(ContinueStmtNode node) throws SemanticError
    {
    }

    @Override
    public void visit(ForStmtNode node) throws SemanticError
    {
    }

    @Override
    public void visit(WhileStmtNode node) throws SemanticError
    {
    }

    //Expr
    @Override
    public void visit(FuncCallExprNode node) throws SemanticError
    {
    }

    @Override
    public void visit(MemberExprNode node) throws SemanticError
    {
    }

    @Override
    public void visit(ArrayExprNode node) throws SemanticError
    {
    }

    @Override
    public void visit(NewExprNode node) throws SemanticError
    {
    }

    @Override
    public void visit(UnaryExprNode node) throws SemanticError
    {
    }

    @Override
    public void visit(BinaryExprNode node) throws SemanticError
    {
    }

    @Override
    public void visit(IdExprNode node) throws SemanticError
    {
    }

    @Override
    public void visit(ThisExprNode node) throws SemanticError
    {
    }

    //Const
    @Override
    public void visit(NullConstNode node) throws SemanticError
    {
    }

    @Override
    public void visit(StringConstNode node) throws SemanticError
    {
    }

    @Override
    public void visit(IntConstNode node) throws SemanticError
    {
    }

    @Override
    public void visit(BoolConstNode node) throws SemanticError
    {
    }
}
