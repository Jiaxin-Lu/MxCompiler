package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Type.*;
import Compiler.Utils.SemanticError;

import java.util.Iterator;
import java.util.Map;

public class SemanticChecker implements ASTVisitor
{
    private GlobalScope globalScope;

    public SemanticChecker(GlobalScope globalScope)
    {
        this.globalScope = globalScope;
    }

    @Override
    public void visit(ProgramNode node) throws SemanticError
    {
        for (ProgramDeclNode x : node.getProgramDeclNodeList()) {
            x.accept(this);
        }
    }

    //Decl
    @Override
    public void visit(VarDeclNode node) throws SemanticError
    {
        if (node.getExpr() != null)
        {
            node.getExpr().accept(this);
            node.getTypeResolved().isCompatible(node.getPosition(), node.getExpr().getTypeResolved());
        } else
        {
            Type type = node.getTypeResolved();
            if (type.isPrimitiveType())
            {
                if (type.getTypeName().equals("int"))
                    node.setExpr(new IntConstNode(null, 0));
                else if (type.getTypeName().equals("bool"))
                    node.setExpr(new BoolConstNode(null, false));
            } else
            {
                if (type.getTypeName().equals("string"))
                    node.setExpr(new StringConstNode(null, "newString"));
                else node.setExpr(new NullConstNode(null));
            }
            node.getExpr().accept(this);
        }
    }

    @Override
    public void visit(ClassDeclNode node) throws SemanticError
    {
        if (node.getConstructorDecl() != null)
            node.getConstructorDecl().accept(this);
        for (FuncDeclNode x : node.getFuncDeclList()) {
            x.accept(this);
        }
    }

    @Override
    public void visit(FuncDeclNode node) throws SemanticError
    {
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
        for (StmtNode x : node.getStmtList()) {
            x.accept(this);
        }
    }

    @Override
    public void visit(VarDeclStmtNode node) throws SemanticError
    {
        for (VarDeclNode varDeclNode : node.getVarDeclList().getVarDeclList())
        {
            varDeclNode.accept(this);
            if (varDeclNode.getExpr() != null)
                varDeclNode.getTypeResolved().isCompatible(node.getPosition(), varDeclNode.getExpr().getTypeResolved());
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
        if (!node.getExpr().isBool())
            throw new SemanticError(node.getPosition(), "Condition must be the type of bool");
        node.getThenStmt().accept(this);
        if (node.getElseStmt() != null) node.getElseStmt().accept(this);
    }

    @Override
    public void visit(ReturnStmtNode node) throws SemanticError
    {
        if (node.getCurrentFunction().getType().getTypeName().equals("void"))
        {
//            System.out.println("1 yes, I'm here in " + node.getCurrentFunction().getTypeName());
            if (node.getExpr() != null)
                throw new SemanticError(node.getPosition(), "Shouldn't have a return expression!");
                // LATER : Or need do nothing
        } else
        {
            if (((FuncDeclNode) node.getCurrentFunction().getOrigin()).getType() == null)
            {
//                System.out.println("2 yes, I'm here in " + node.getCurrentFunction().getTypeName());
                if (node.getExpr() != null)
                    throw new SemanticError(node.getPosition(), "Constructor shouldn't have a return expression!");
                    // LATER : Or need do nothing
            } else
            {
//                System.out.println("3 yes, I'm here in " + node.getCurrentFunction().getTypeName());
                if (node.getExpr() == null)
                    throw new SemanticError(node.getPosition(), "Should have a return expression!");
                node.getExpr().accept(this);
                node.getCurrentFunction().getType().isCompatible(node.getPosition(), node.getExpr().getTypeResolved());
            }
        }
    }

    @Override
    public void visit(BreakStmtNode node) throws SemanticError
    {
        //Blank
    }

    @Override
    public void visit(ContinueStmtNode node) throws SemanticError
    {
        //Blank
    }

    @Override
    public void visit(ForStmtNode node) throws SemanticError
    {
        if (node.getInit() != null) node.getInit().accept(this);
        if (node.getCond() != null)
        {
            node.getCond().accept(this);
            if (!node.getCond().isBool())
                throw new SemanticError(node.getPosition(), "Condition must be the type of bool!");
        }
        if (node.getStep() != null) node.getStep().accept(this);
        if (node.getStatement() != null) node.getStatement().accept(this);
    }

    @Override
    public void visit(WhileStmtNode node) throws SemanticError
    {
        node.getExpr().accept(this);
        if (!node.getExpr().isBool())
            throw new SemanticError(node.getPosition(), "Condition must be the type of bool!");
        if (node.getStatement() != null) node.getStatement().accept(this);
    }

    //Expr
    @Override
    public void visit(FuncCallExprNode node) throws SemanticError
    {
        ExprNode function = node.getFunctionExpr();
        function.accept(this);
        for (ExprNode x : node.getParameterList()) {
            x.accept(this);
        }
        if (!function.canCall())
            throw new SemanticError(node.getPosition(), "Function can't call!");
        if (node.getParameterList().size() != function.getFunctionSymbol().getArguments().size())
            throw new SemanticError(node.getPosition(), "Parameters can't match");
        Iterator<Map.Entry<String, VariableSymbol>> entryIterator = function.getFunctionSymbol().getArguments().entrySet().iterator();
        for (ExprNode value : node.getParameterList()) {
            Map.Entry<String, VariableSymbol> entry = entryIterator.next();
            if (!value.isVal())
                throw new SemanticError(node.getPosition(), "Parameter not valid!");
            entry.getValue().getType().isCompatible(node.getPosition(), value.getTypeResolved());
        }
        node.setExprType(ExprNode.ExprType.RIGHT);
        node.setTypeResolved(function.getFunctionSymbol().getType());
    }

    @Override
    public void visit(MemberExprNode node) throws SemanticError
    {
        node.getExpr().accept(this);
        if (node.getExpr().canAccess())
        {
            ClassSymbol classSymbol = (ClassSymbol) node.getExpr().getTypeResolved();
            Symbol memberSymbol = classSymbol.resolveMember(node.getPosition(), node.getId());
            node.setMember(memberSymbol);
            if (memberSymbol instanceof VariableSymbol)
            {
                node.setExprType(ExprNode.ExprType.LEFT);
                node.setTypeResolved(memberSymbol.getType());
            } else if (memberSymbol instanceof FunctionSymbol)
            {
                node.setExprType(ExprNode.ExprType.FUNCTION);
                node.setTypeResolved(memberSymbol.getType());
                node.setFunctionSymbol((FunctionSymbol) memberSymbol);
            }
        } else if (node.getExpr().getTypeResolved().isArrayType())
        {
            if (!node.getId().equals("size"))
                throw new SemanticError(node.getPosition(), "Not a builtin function!");
            node.setExprType(ExprNode.ExprType.FUNCTION);
            node.setTypeResolved(globalScope.getIntTypeSymbol());
            node.setFunctionSymbol(globalScope.getArraySizeSymbol());
        }
        else throw new SemanticError(node.getPosition(), "Can't access this member!");
    }

    @Override
    public void visit(ArrayExprNode node) throws SemanticError
    {
        ExprNode array = node.getArray();
        ExprNode index = node.getIndex();
        array.accept(this);
        index.accept(this);
        if (!array.getTypeResolved().isArrayType())
            throw new SemanticError(node.getPosition(), "Array should have array type!");
        if (!index.isInt())
            throw new SemanticError(node.getPosition(), "Index should be int!");
        node.setExprType(ExprNode.ExprType.LEFT);
        if (((ArraySymbol)array.getTypeResolved()).getDims() == 1)
        {
            node.setTypeResolved(((ArraySymbol)array.getTypeResolved()).getType());
        } else {
            node.setTypeResolved(new ArraySymbol(((ArraySymbol)array.getTypeResolved()).getType(),
                    ((ArraySymbol)array.getTypeResolved()).getDims() - 1));
        }
        //DONE : array node.setType
    }

    @Override
    public void visit(NewExprNode node) throws SemanticError
    {
        for (ExprNode exprNode : node.getExprList())
        {
            exprNode.accept(this);
            if (!exprNode.isInt())
                throw new SemanticError(node.getPosition(), "Array index should be int!");
        }
        Type type = node.getBaseTypeResolved();
        if (node.getDims() == 0)
        {
            node.setExprType(ExprNode.ExprType.RIGHT);
            node.setTypeResolved(type);
            if (type.isClassType())
                if (!type.getTypeName().equals("string"))
                    if (((ClassSymbol)type).getConstructor() != null)
                        node.setFunctionSymbol(((ClassSymbol)type).getConstructor());
        } else
        {
            node.setExprType(ExprNode.ExprType.RIGHT);
            node.setTypeResolved(new ArraySymbol(type, node.getDims()));
        }
    }

    @Override
    public void visit(UnaryExprNode node) throws SemanticError
    {
        node.getExpr().accept(this);
        switch (node.getOp())
        {
            case ADDP:
            case SUBP: {
                if (!node.getExpr().isIntVariable())
                    throw new SemanticError(node.getPosition(), "Should be integer!");
                node.setExprType(ExprNode.ExprType.LEFT);
                node.setTypeResolved(globalScope.getIntTypeSymbol());
                break;
            }
            case ADDS:
            case SUBS: {
                if (!node.getExpr().isIntVariable())
                    throw new SemanticError(node.getPosition(), "Should be integer!");
                node.setExprType(ExprNode.ExprType.RIGHT);
                node.setTypeResolved(globalScope.getIntTypeSymbol());
                break;
            }
            case NEG:
            case NOT:
            case POS: {
                if (!node.getExpr().isInt())
                    throw new SemanticError(node.getPosition(), "Should be integer!");
                node.setExprType(ExprNode.ExprType.RIGHT);
                node.setTypeResolved(globalScope.getIntTypeSymbol());
                break;
            }
            case NOTI: {
                if (node.getExpr().isBool())
                {
                    node.setExprType(ExprNode.ExprType.RIGHT);
                    node.setTypeResolved(globalScope.getBoolTypeSymbol());
                }
                break;
            }
            default:
                break;
        }
    }

    @Override
    public void visit(BinaryExprNode node) throws SemanticError
    {
        node.getLhs().accept(this);
        node.getRhs().accept(this);
        ExprNode lhs = node.getLhs();
        ExprNode rhs = node.getRhs();
        switch (node.getOp())
        {
            case MUL:
            case DIV:
            case MOD:
            case SUB:
            case SHL:
            case SHR:
            case AND:
            case XOR:
            case OR: {
                if (!(lhs.isInt() && rhs.isInt()))
                    throw new SemanticError(node.getPosition(), "Both sides should be integer!");
                node.setExprType(ExprNode.ExprType.RIGHT);
                node.setTypeResolved(globalScope.getIntTypeSymbol());
                break;
            }
            case ADD: {
                if (lhs.isInt() && rhs.isInt())
                {
                    node.setExprType(ExprNode.ExprType.RIGHT);
                    node.setTypeResolved(globalScope.getIntTypeSymbol());
                } else if (lhs.isString() && rhs.isString())
                {
                    node.setExprType(ExprNode.ExprType.RIGHT);
                    node.setTypeResolved(globalScope.getString());
                } else
                    throw new SemanticError(node.getPosition(), "Both sides should be integer or string!");
                break;
            }
            case LEQ:
            case REQ:
            case LT:
            case RT: {
                if (lhs.isInt() && rhs.isInt())
                {
                    node.setExprType(ExprNode.ExprType.RIGHT);
                    node.setTypeResolved(globalScope.getBoolTypeSymbol());
                } else if (lhs.isString() && rhs.isString())
                {
                    node.setExprType(ExprNode.ExprType.LEFT);
                    node.setTypeResolved(globalScope.getBoolTypeSymbol());
                } else
                    throw new SemanticError(node.getPosition(), "Both sides should be integer or string!");
                break;
            }
            case EQ:
            case NEQ: {
                if ((lhs.isInt() && rhs.isInt())
                        || (lhs.isBool() && rhs.isBool())
                        || (lhs.isString() && rhs.isString())
                        || (lhs.canNull() && rhs.isNull())
                        || (lhs.isNull() && rhs.canNull()))
                {
                    node.setExprType(ExprNode.ExprType.RIGHT);
                    node.setTypeResolved(globalScope.getBoolTypeSymbol());
                } else
                    throw new SemanticError(node.getPosition(), "Both sides should match!");
                break;
            }
            case ANDI:
            case ORI: {
                if (!(lhs.isBool() && rhs.isBool()))
                    throw new SemanticError(node.getPosition(), "Both sides should be bool!");
                node.setExprType(ExprNode.ExprType.RIGHT);
                node.setTypeResolved(globalScope.getBoolTypeSymbol());
                break;
            }
            case ASS: {
                if (!(lhs.canAssign() && rhs.isVal()))
                    throw new SemanticError(node.getPosition(), "Should be left value!");
                lhs.getTypeResolved().isCompatible(node.getPosition(), rhs.getTypeResolved());
                node.setExprType(ExprNode.ExprType.RIGHT);
                node.setTypeResolved(globalScope.getVoidTypeSymbol());
                break;
            }
            default:
                break;
        }
    }

    @Override
    public void visit(IdExprNode node) throws SemanticError
    {
        Symbol symbol = node.getSymbol();
        if (((Type)symbol).isClassType())
        {
            node.setExprType(ExprNode.ExprType.CLASS);
            node.setTypeResolved(symbol.getType());
        } else if (((Type)symbol).isFunctionType())
        {
            node.setExprType(ExprNode.ExprType.FUNCTION);
            node.setTypeResolved(symbol.getType());
            node.setFunctionSymbol((FunctionSymbol) symbol);
        } else if (((Type)symbol).isVariableType())
        {
            node.setExprType(ExprNode.ExprType.LEFT);
            node.setTypeResolved(symbol.getType());
        }
    }

    @Override
    public void visit(ThisExprNode node) throws SemanticError
    {
        node.setExprType(ExprNode.ExprType.RIGHT);
        node.setTypeResolved((ClassSymbol) node.getScope());
    }

    //Const
    @Override
    public void visit(NullConstNode node) throws SemanticError
    {
        node.setExprType(ExprNode.ExprType.RIGHT);
        node.setTypeResolved(new NullType());
    }

    @Override
    public void visit(StringConstNode node) throws SemanticError
    {
        node.setExprType(ExprNode.ExprType.RIGHT);
        node.setTypeResolved(globalScope.getString());
    }

    @Override
    public void visit(IntConstNode node) throws SemanticError
    {
        node.setExprType(ExprNode.ExprType.RIGHT);
        node.setTypeResolved(globalScope.getIntTypeSymbol());
    }

    @Override
    public void visit(BoolConstNode node) throws SemanticError
    {
        node.setExprType(ExprNode.ExprType.RIGHT);
        node.setTypeResolved(globalScope.getBoolTypeSymbol());
    }

}
