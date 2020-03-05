package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Type.*;
import Compiler.Utils.SemanticError;

import javax.lang.model.type.PrimitiveType;

public class FunctionInitializer implements ASTVisitor
{
    private GlobalScope globalScope;
    public FunctionInitializer(GlobalScope globalScope)
    {
        this.globalScope = globalScope;
    }

    @Override
    public void visit(ProgramNode node) throws SemanticError
    {
        for (ProgramDeclNode x : node.getProgramDeclNodeList()) {
            x.accept(this);
        }

        //Check Main
        Symbol main = globalScope.resolveMain();
        if (!(main.getType() instanceof PrimitiveTypeSymbol))
            throw new SemanticError(node.getPosition(), "Main must have return type of int!");
        if (!main.getType().getTypeName().equals("int"))
            throw new SemanticError(node.getPosition(), "Main should be type of int!");
        if (!((FuncDeclNode)main.getOrigin()).getParameterList().isEmpty())
            throw new SemanticError(node.getPosition(), "Main mustn't have any parameter!");
    }

    //Decl
    @Override
    public void visit(VarDeclNode node) throws SemanticError
    {
    }

    @Override
    public void visit(ClassDeclNode node) throws SemanticError
    {
    }

    @Override
    public void visit(FuncDeclNode node) throws SemanticError
    {
        if (node.getType() == null)
            throw new SemanticError(node.getPosition(), "Global Function should have a type!");
        Type type = globalScope.getTypeForTypeNode(node.getType());
        FunctionSymbol functionSymbol = new FunctionSymbol(node.getId(), type, node, globalScope);
//        if (node.getId().equals("main"))
//        {
//            System.out.println("ok");
//        }
        node.setFunctionSymbol(functionSymbol);
        for (VarDeclNode varDeclNode : node.getParameterList())
        {
            Type varType = globalScope.getTypeForTypeNode(varDeclNode.getType());
            VariableSymbol variableSymbol = new VariableSymbol(varDeclNode.getId(), varType, varDeclNode);
            varDeclNode.setVariableSymbol(variableSymbol);
            functionSymbol.defineVariable(variableSymbol);
        }
        globalScope.defineFunction(functionSymbol);
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
