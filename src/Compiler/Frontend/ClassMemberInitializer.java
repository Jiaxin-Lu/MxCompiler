package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Type.*;
import Compiler.Utils.SemanticError;

public class ClassMemberInitializer implements ASTVisitor
{
    private GlobalScope globalScope;
    private Scope currentScope;

    public ClassMemberInitializer(GlobalScope globalScope)
    {
        this.globalScope = globalScope;
    }

    @Override
    public void visit(ProgramNode node) throws SemanticError
    {
        for (ProgramDeclNode programDeclNode : node.getProgramDeclNodeList())
        {
            if (programDeclNode instanceof ClassDeclNode)
                programDeclNode.accept(this);
        }
    }

    //Decl
    @Override
    public void visit(VarDeclNode node) throws SemanticError
    {
        Type type = globalScope.getTypeForTypeNode(node.getType());
        VariableSymbol variableSymbol = new VariableSymbol(node.getId(), type, node);
        variableSymbol.setScope(currentScope);
        node.setVariableSymbol(variableSymbol);
        globalScope.TypeConflict(variableSymbol);
        currentScope.defineVariable(variableSymbol); //DONE : CHECK GLOBALLY
    }

    @Override
    public void visit(ClassDeclNode node) throws SemanticError
    {
        ClassSymbol classSymbol = node.getClassSymbol();
        this.currentScope = classSymbol;
        for (VarDeclNode x : node.getVarDeclList()) {
            x.accept(this);
        }
        if (node.getConstructorDecl() != null)
        {
            node.getConstructorDecl().accept(this);
            this.currentScope = classSymbol;
        }
        for (FuncDeclNode funcDeclNode : node.getFuncDeclList())
        {
            funcDeclNode.accept(this);
            this.currentScope = classSymbol;
        }
    }

    @Override
    public void visit(FuncDeclNode node) throws SemanticError
    {
        Type type = node.getType() == null ? (ClassSymbol) currentScope : globalScope.getTypeForTypeNode(node.getType());
        FunctionSymbol functionSymbol = new FunctionSymbol(node.getId(), type, node, currentScope);
        node.setFunctionSymbol(functionSymbol);
        currentScope.defineFunction(functionSymbol);

        if (node.getId().equals(((ClassSymbol) currentScope).getTypeName()))
        {
            if (node.getType() != null)
                throw new SemanticError(node.getPosition(), "Function name can't be the same as the class name!");
            else ((ClassSymbol) currentScope).setConstructor(functionSymbol);
        }
        this.currentScope = functionSymbol;
        for (VarDeclNode x : node.getParameterList()) {
            x.accept(this);
        }
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
