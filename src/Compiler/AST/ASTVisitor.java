package Compiler.AST;

import Compiler.Utils.SemanticError;

import java.util.IdentityHashMap;

public interface ASTVisitor
{
    public void visit(ProgramNode node) throws SemanticError;

    //Decl
    public void visit(VarDeclNode node) throws SemanticError;

    public void visit(ClassDeclNode node) throws SemanticError;

    public void visit(FuncDeclNode node) throws SemanticError;

    public void visit(VarDeclListNode node) throws SemanticError;

    //Type
    public void visit(ArrayTypeNode node) throws SemanticError;

    public void visit(VoidTypeNode node) throws SemanticError;

    public void visit(IntTypeNode node) throws SemanticError;

    public void visit(BoolTypeNode node) throws SemanticError;

    public void visit(StringTypeNode node) throws SemanticError;

    public void visit(ClassTypeNode node) throws SemanticError;

    //Stmt
    public void visit(BlockStmtNode node) throws SemanticError;

    public void visit(VarDeclStmtNode node) throws SemanticError;

    public void visit(ExprStmtNode node) throws SemanticError;

    public void visit(IfStmtNode node) throws SemanticError;

    public void visit(ReturnStmtNode node) throws SemanticError;

    public void visit(BreakStmtNode node) throws SemanticError;

    public void visit(ContinueStmtNode node) throws SemanticError;

    public void visit(ForStmtNode node) throws SemanticError;

    public void visit(WhileStmtNode node) throws SemanticError;

    //Expr
    public void visit(FuncCallExprNode node) throws SemanticError;

    public void visit(MemberExprNode node) throws SemanticError;

    public void visit(ArrayExprNode node) throws SemanticError;

    public void visit(NewExprNode node) throws SemanticError;

    public void visit(UnaryExprNode node) throws SemanticError;

    public void visit(BinaryExprNode node) throws SemanticError;

    public void visit(IdExprNode node) throws SemanticError;

    public void visit(ThisExprNode node) throws SemanticError;

    //Const
    public void visit(NullConstNode node) throws SemanticError;

    public void visit(StringConstNode node) throws SemanticError;

    public void visit(IntConstNode node) throws SemanticError;

    public void visit(BoolConstNode node) throws SemanticError;
}