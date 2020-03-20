package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Type.*;
import Compiler.Utils.SemanticError;

import java.util.HashSet;
import java.util.Set;

//DONE : EVERYTHING!

public class UnusedEliminator implements ASTVisitor
{
    private GlobalScope globalScope;
    private Scope currentScope;
    private boolean inDefine = false;
    private Set<VariableSymbol> definedSymbolSet = new HashSet<>();
    private Set<VariableSymbol> usedSymbolSet = new HashSet<>();

    public UnusedEliminator(GlobalScope globalScope)
    {
        this.globalScope = globalScope;
    }

    @Override
    public void visit(ProgramNode node) throws SemanticError
    {
        currentScope = globalScope;
        for (ProgramDeclNode programDeclNode : node.getProgramDeclNodeList())
        {
            programDeclNode.accept(this);
            currentScope = globalScope;
        }
        for (VariableSymbol variableSymbol : definedSymbolSet)
        {
            if (!usedSymbolSet.contains(variableSymbol))
            {
                variableSymbol.setUnUsed(true);
                // MAYBE DONE : CHECK IS ALL THIS RIGHT?
                // System.out.println(variableSymbol.getName());
            }
        }
    }

    //Decl
    @Override
    public void visit(VarDeclNode node) throws SemanticError
    {
        if (node.getExpr() != null)
        {
            VariableSymbol variableSymbol = node.getVariableSymbol();
            // TODO: what's necessary?
            // if (variableSymbol.getType() instanceof ArraySymbol || node.isGlobalVar())
            definedSymbolSet.add(variableSymbol);
            node.getExpr().accept(this);
        }
    }

    @Override
    public void visit(ClassDeclNode node) throws SemanticError
    {
        ClassSymbol classSymbol = node.getClassSymbol();
        currentScope = classSymbol;
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
        currentScope = functionSymbol;
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
        currentScope = node.getBlockScope();
        for (StmtNode stmtNode : node.getStmtList())
        {
            stmtNode.accept(this);
            currentScope = node.getBlockScope();
        }
    }

    @Override
    public void visit(VarDeclStmtNode node) throws SemanticError
    {
        for (VarDeclNode varDeclNode : node.getVarDeclList().getVarDeclList())
        {
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
        if (node.getInit() != null) node.getInit().accept(this);
        if (node.getCond() != null) node.getCond().accept(this);;
        if (node.getStep() != null) node.getStep().accept(this);
        if (node.getStatement() != null) node.getStatement().accept(this);
    }

    @Override
    public void visit(WhileStmtNode node) throws SemanticError
    {
        if (node.getExpr() != null) node.getExpr().accept(this);
        if (node.getStatement() != null) node.getStatement().accept(this);
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
        if (inDefine)
        {
            node.getArray().accept(this);
            inDefine = false;
            node.getIndex().accept(this);
            inDefine = true;
        } else {
            node.getArray().accept(this);
            node.getIndex().accept(this);
        }
    }

    @Override
    public void visit(NewExprNode node) throws SemanticError
    {
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
        if (node.getOp() == BinaryExprNode.Op.ASS)
        {
            //TODO : what's necessary?
            if (node.getRhs().getTypeResolved() instanceof ArraySymbol || !(node.getRhs() instanceof NewExprNode))
            {
                node.getLhs().accept(this);
                node.getRhs().accept(this);
            } else
            {
                inDefine = true;
                node.getLhs().accept(this);
                inDefine = false;
                node.getRhs().accept(this);
            }
        } else
        {
            node.getLhs().accept(this);
            node.getRhs().accept(this);
        }
    }

    @Override
    public void visit(IdExprNode node) throws SemanticError
    {
        Symbol symbol = node.getSymbol();
        if (symbol instanceof VariableSymbol)
        {
            //TODO : What's necessary?
            if (inDefine)
                definedSymbolSet.add((VariableSymbol)symbol);
            else
                usedSymbolSet.add((VariableSymbol)symbol);
//            if (symbol.getType() instanceof ArraySymbol || ((VarDeclNode)symbol.getOrigin()).isGlobalVar())
//            {
//                if (indefine)
//                    definedSymbolSet.add((VariableSymbol)symbol);
//                else
//                    usedSymbolSet.add((VariableSymbol)symbol);
//            }
        }
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
