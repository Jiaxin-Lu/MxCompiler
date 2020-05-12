package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Type.*;
import Compiler.Utils.SemanticError;

import java.util.Stack;

public class ScopeBuilder implements ASTVisitor
{
    private GlobalScope globalScope;
    private Scope currentScope;
    private ClassSymbol currentClass;
    private FunctionSymbol currentFunction;
    private Stack<LoopStmtNode> loopStack = new Stack<>();

    public ScopeBuilder(GlobalScope globalScope)
    {
        this.globalScope = globalScope;
    }

    @Override
    public void visit(ProgramNode node) throws SemanticError
    {
        currentScope = globalScope;
        currentClass = null;
        currentFunction = null;
        for (ProgramDeclNode programDeclNode : node.getProgramDeclNodeList())
        {
            programDeclNode.accept(this);
            currentScope = globalScope;
            currentClass = null;
            currentFunction = null;
        }
    }

    //Decl
    @Override
    public void visit(VarDeclNode node) throws SemanticError
    {
        if (node.getExpr() != null) node.getExpr().accept(this);
        Type type = globalScope.getTypeForTypeNode(node.getType());
        node.setTypeResolved(type);
        VariableSymbol variableSymbol = new VariableSymbol(node.getId(), type, node);
        node.setVariableSymbol(variableSymbol);
        globalScope.TypeConflict(variableSymbol);
        currentScope.defineVariable(variableSymbol); //DONE : CHECK GLOBALLY
        if (currentScope == globalScope)
        {
            node.setGlobalVar();
            node.getVariableSymbol().setGlobal();
        }
    }

    @Override
    public void visit(ClassDeclNode node) throws SemanticError
    {
        ClassSymbol classSymbol = node.getClassSymbol();
        currentScope = classSymbol;
        currentClass = classSymbol;
        if (node.getConstructorDecl() != null)
        {
            node.getConstructorDecl().accept(this);
            currentScope = classSymbol;
        }
        for (FuncDeclNode funcDeclNode : node.getFuncDeclList())
        {
            funcDeclNode.accept(this);
            currentScope = classSymbol;
        }
    }

    @Override
    public void visit(FuncDeclNode node) throws SemanticError
    {
        FunctionSymbol functionSymbol = node.getFunctionSymbol();
        //FunctionSymbol functionSymbol = (FunctionSymbol) currentScope.resolveSymbol(node.getPosition(), node.getId());
        currentScope = functionSymbol;
        currentFunction = functionSymbol;
        visit(node.getBlock());
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
        LocalScope blockScope = new LocalScope("block scope", currentScope);
        node.setBlockScope(blockScope);
        currentScope = blockScope;
        for (StmtNode stmtNode : node.getStmtList())
        {
            stmtNode.accept(this);
            currentScope = blockScope;
        }
    }

    @Override
    public void visit(VarDeclStmtNode node) throws SemanticError
    {
        for (VarDeclNode varDeclNode : node.getVarDeclList().getVarDeclList()) {
            varDeclNode.accept(this);
        }
    }

    @Override
    public void visit(ExprStmtNode node) throws SemanticError
    {
        node.getExpr().accept(this);
    }

    @Override
    public void visit(IfStmtNode node) throws SemanticError
    {
        node.getExpr().accept(this);
        node.getThenStmt().accept(this);
        if (node.getElseStmt() != null) node.getElseStmt().accept(this);
    }

    @Override
    public void visit(ReturnStmtNode node) throws SemanticError
    {
        if (node.getExpr() != null) node.getExpr().accept(this);
        if (currentFunction == null)
            throw new SemanticError(node.getPosition(), "Return must be in a function!");
        node.setCurrentFunction(currentFunction);
    }

    @Override
    public void visit(BreakStmtNode node) throws SemanticError
    {
        if (loopStack.empty())
            throw new SemanticError(node.getPosition(), "Break must be in a loop!");
        node.setLoop(loopStack.peek());
    }

    @Override
    public void visit(ContinueStmtNode node) throws SemanticError
    {
        if (loopStack.empty())
            throw new SemanticError(node.getPosition(), "Continue must be in a loop!");
        node.setLoop(loopStack.peek());
    }

    @Override
    public void visit(ForStmtNode node) throws SemanticError
    {
        loopStack.push(node);
        if (node.getInit() != null) node.getInit().accept(this);
        if (node.getCond() != null) node.getCond().accept(this);
        if (node.getStep() != null) node.getStep().accept(this);
        if (node.getStatement() != null) node.getStatement().accept(this);
        loopStack.pop();
    }

    @Override
    public void visit(WhileStmtNode node) throws SemanticError
    {
        loopStack.push(node);
        if (node.getExpr() != null) node.getExpr().accept(this);
        if (node.getStatement() != null) node.getStatement().accept(this);
        loopStack.pop();
    }

    //Expr
    @Override
    public void visit(FuncCallExprNode node) throws SemanticError
    {
        node.getFunctionExpr().accept(this);
        for (ExprNode x : node.getParameterList()) {
            x.accept(this);
        }
    }

    @Override
    public void visit(MemberExprNode node) throws SemanticError
    {
        node.getExpr().accept(this);
    }

    @Override
    public void visit(ArrayExprNode node) throws SemanticError
    {
        node.getArray().accept(this);
        node.getIndex().accept(this);
    }

    @Override
    public void visit(NewExprNode node) throws SemanticError
    {
        Type type = globalScope.getTypeForTypeNode(node.getBaseType());
//        if (type == null)
//        {
//            System.out.println("type is null");
//        }
        node.setBaseTypeResolved(type);
        for (ExprNode x : node.getExprList()) {
            x.accept(this);
        }
    }

    @Override
    public void visit(UnaryExprNode node) throws SemanticError
    {
        node.getExpr().accept(this);
    }

    @Override
    public void visit(BinaryExprNode node) throws SemanticError
    {
        node.getLhs().accept(this);
        node.getRhs().accept(this);
    }

    @Override
    public void visit(IdExprNode node) throws SemanticError
    {
        Symbol symbol = currentScope.resolveSymbol(node.getPosition(), node.getId());
        node.setSymbol(symbol);
    }

    @Override
    public void visit(ThisExprNode node) throws SemanticError
    {
        if (currentClass == null) throw new SemanticError(node.getPosition(), "'this' must be in a class!");
        node.setScope(currentClass);
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
