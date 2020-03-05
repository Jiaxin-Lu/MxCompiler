package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Parser.MxBaseVisitor;
import Compiler.Parser.MxParser;
import Compiler.Utils.*;

import java.util.ArrayList;
import java.util.List;


public class ASTBuilder extends MxBaseVisitor<ASTNode>
{
    SyntaxErrorHandler syntaxErrorHandler;

    public ASTBuilder(SyntaxErrorHandler syntaxErrorHandler)
    {
        this.syntaxErrorHandler = syntaxErrorHandler;
    }

    @Override
    public ASTNode visitProgram(MxParser.ProgramContext ctx)
    {
        List<ProgramDeclNode> declList = new ArrayList<>();
        for (var programDecl : ctx.programDecl())
        {
            ASTNode decl = visit(programDecl);
            if (decl instanceof VarDeclListNode)
                declList.addAll(((VarDeclListNode) decl).getVarDeclList());
            else declList.add((ProgramDeclNode) decl);
        }
        return new ProgramNode(new Position(ctx.getStart()), declList);
    }

    @Override
    public ASTNode visitProgramDecl(MxParser.ProgramDeclContext ctx)
    {
        if (ctx.functionDecl() != null) return visit(ctx.functionDecl());
        if (ctx.variableDecl() != null) return visit(ctx.variableDecl());
        if (ctx.classDecl() != null) return visit(ctx.classDecl());
        return null;
    }

    @Override
    public ASTNode visitVariableDecl(MxParser.VariableDeclContext ctx)
    {
        TypeNode type = (TypeNode) visit(ctx.type());
        VarDeclListNode varDeclList = (VarDeclListNode) visit(ctx.variableList());
        varDeclList.setType(type);
        return varDeclList;
    }

    @Override
    public ASTNode visitFunctionDecl(MxParser.FunctionDeclContext ctx)
    {
        TypeNode type = ctx.withVoidType() == null ? null : (TypeNode) visit(ctx.withVoidType());
        String id = ctx.Identifier().getText();
        List<VarDeclNode> parameterList = new ArrayList<>();
        if (ctx.parameterList() != null)
        {
            ASTNode decl = visit(ctx.parameterList());
            parameterList.addAll(((VarDeclListNode)decl).getVarDeclList());
        }
        BlockStmtNode block = (BlockStmtNode) visit(ctx.block());
        return new FuncDeclNode(new Position(ctx.getStart()), type, id, parameterList, block);
    }

    @Override
    public ASTNode visitClassDecl(MxParser.ClassDeclContext ctx)
    {
        String id = ctx.Identifier().getText();
        List<VarDeclNode> varDeclList = new ArrayList<>();
        List<FuncDeclNode> funcDeclList = new ArrayList<>();
        FuncDeclNode constructorDecl = null;

        for (var decl : ctx.variableDecl())
        {
            varDeclList.addAll(((VarDeclListNode) visit(decl)).getVarDeclList());
        }
        for (var decl : ctx.functionDecl())
        {
            funcDeclList.add((FuncDeclNode) visit(decl));
        }
        if (ctx.constructorDecl().size() > 1)
        {
            syntaxErrorHandler.syntaxError(new Position(ctx.getStart()), "Duplicated constructor!");
            //throw new SyntaxError(new Position(ctx.getStart()), "Duplicated constructor!");
            // DONE: ERROR - multiple constructor
        } else {
            for (var decl : ctx.constructorDecl())
            {
                if (!decl.Identifier().getText().equals(id))
                {
                    syntaxErrorHandler.syntaxError(new Position(ctx.getStart()), "Unknown constructor!");
                    //throw new SyntaxError(new Position(ctx.getStart()), "Unknown constructor!");
                    // DONE: ERROR - unknown constructor
                } else
                    constructorDecl = (FuncDeclNode) visit(decl);
            }
        }
        return new ClassDeclNode(new Position(ctx.getStart()), id, funcDeclList, varDeclList, constructorDecl);
    }

    @Override
    public ASTNode visitConstructorDecl(MxParser.ConstructorDeclContext ctx)
    {
        TypeNode type = new VoidTypeNode(new Position(ctx.getStart()));
        String id = ctx.Identifier().getText();
        List<VarDeclNode> parameterList = new ArrayList<>();
        if (ctx.parameterList() != null)
        {
            ASTNode decl = visit(ctx.parameterList());
            parameterList.addAll(((VarDeclListNode)decl).getVarDeclList());
        }
        BlockStmtNode block = (BlockStmtNode) visit(ctx.block());
        return new FuncDeclNode(new Position(ctx.getStart()), type, id, parameterList, block);
    }

    @Override
    public ASTNode visitArrayType(MxParser.ArrayTypeContext ctx)
    {
        return new ArrayTypeNode(new Position(ctx.getStart()), (TypeNode) visit(ctx.type()));
    }

    @Override
    public ASTNode visitNArrayType(MxParser.NArrayTypeContext ctx)
    {
        return visit(ctx.nonArraytype());
    }

    @Override
    public ASTNode visitNArrayTypeInt(MxParser.NArrayTypeIntContext ctx)
    {
        return new IntTypeNode(new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitNArrayTypeBool(MxParser.NArrayTypeBoolContext ctx)
    {
        return new BoolTypeNode(new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitNArrayTypeString(MxParser.NArrayTypeStringContext ctx)
    {
        return new StringTypeNode(new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitNArrayTypeId(MxParser.NArrayTypeIdContext ctx)
    {
        return new ClassTypeNode(new Position(ctx.getStart()), ctx.Identifier().getText());
    }

    @Override
    public ASTNode visitWithVoidType(MxParser.WithVoidTypeContext ctx)
    {
        if (ctx.type() != null) return visit(ctx.type());
        else return new VoidTypeNode(new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitVariableList(MxParser.VariableListContext ctx)
    {
        VarDeclListNode varDeclList = new VarDeclListNode(new Position(ctx.getStart()));
        for (var var : ctx.variableSingle())
        {
            varDeclList.addVar((VarDeclNode) visit(var));
        }
        return varDeclList;
    }

    @Override
    public ASTNode visitVariableSingle(MxParser.VariableSingleContext ctx)
    {
        ExprNode expr = ctx.expression() == null ? null : (ExprNode) visit(ctx.expression());
        return new VarDeclNode(new Position(ctx.getStart()), null, ctx.Identifier().getText(), expr);
    }

    @Override
    public ASTNode visitParameterList(MxParser.ParameterListContext ctx)
    {
        VarDeclListNode parameterList = new VarDeclListNode(new Position(ctx.getStart()));
        for (var decl : ctx.parameter())
            parameterList.addVar((VarDeclNode) visit(decl));
        return parameterList;
    }

    @Override
    public ASTNode visitParameter(MxParser.ParameterContext ctx)
    {
        TypeNode type = (TypeNode) visit(ctx.type());
        String id = ctx.Identifier().getText();
        return new VarDeclNode(new Position(ctx.getStart()), type, id, null);
    }

    @Override
    public ASTNode visitBlock(MxParser.BlockContext ctx)
    {
        List<StmtNode> stmtList = new ArrayList<>();
        for (var stmt : ctx.statement())
        {
            StmtNode stmtNode = (StmtNode) visit(stmt);
            if (stmtNode != null) stmtList.add(stmtNode);
        }
        return new BlockStmtNode(new Position(ctx.getStart()), stmtList);
    }

    @Override
    public ASTNode visitBlockStmt(MxParser.BlockStmtContext ctx)
    {
        return visit(ctx.block());
    }

    @Override
    public ASTNode visitVariableDeclStmt(MxParser.VariableDeclStmtContext ctx)
    {
        return new VarDeclStmtNode(new Position(ctx.getStart()), (VarDeclListNode) visit(ctx.variableDecl()));
    }

    @Override
    public ASTNode visitExpressionStmt(MxParser.ExpressionStmtContext ctx)
    {
        return new ExprStmtNode(new Position(ctx.getStart()), (ExprNode) visit(ctx.expression()));
    }

    @Override
    public ASTNode visitConditionalStmt(MxParser.ConditionalStmtContext ctx)
    {
        return visit(ctx.conditionalStatement());
    }

    @Override
    public ASTNode visitJumpStmt(MxParser.JumpStmtContext ctx)
    {
        return visit(ctx.jumpStatement());
    }

    @Override
    public ASTNode visitLoopStmt(MxParser.LoopStmtContext ctx)
    {
        return visit(ctx.loopStatement());
    }

    @Override
    public ASTNode visitBlankStmt(MxParser.BlankStmtContext ctx)
    {
        return null;
    }

    @Override
    public ASTNode visitIfStmt(MxParser.IfStmtContext ctx)
    {
        ExprNode condExpr = (ExprNode) visit(ctx.expression());
        StmtNode thenStmt = (StmtNode) visit(ctx.thenStatement);
        StmtNode elseStmt = ctx.elseStatement == null ? null : (StmtNode) visit(ctx.elseStatement);
        if (!(thenStmt instanceof BlockStmtNode))
            thenStmt = new BlockStmtNode(new Position(ctx.getStart()), thenStmt);
        if (elseStmt != null && !(elseStmt instanceof BlockStmtNode))
            elseStmt = new BlockStmtNode(new Position(ctx.getStart()), elseStmt);
        return new IfStmtNode(new Position(ctx.getStart()), condExpr, thenStmt, elseStmt);
    }

    @Override
    public ASTNode visitReturnStmt(MxParser.ReturnStmtContext ctx)
    {
        if (ctx.expression() == null)
            return new ReturnStmtNode(new Position(ctx.getStart()), null);
        else return new ReturnStmtNode(new Position(ctx.getStart()), (ExprNode) visit(ctx.expression()));
    }

    @Override
    public ASTNode visitBreakStmt(MxParser.BreakStmtContext ctx)
    {
        return new BreakStmtNode(new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitContinueStmt(MxParser.ContinueStmtContext ctx)
    {
        return new ContinueStmtNode(new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitWhileStmt(MxParser.WhileStmtContext ctx)
    {
        ExprNode expr = (ExprNode) visit(ctx.expression());
        StmtNode stmt = (StmtNode) visit(ctx.statement());
        if (!(stmt instanceof BlockStmtNode))
            stmt = new BlockStmtNode(new Position(ctx.getStart()), stmt);
        return new WhileStmtNode(new Position(ctx.getStart()), expr, stmt);
    }

    @Override
    public ASTNode visitForStmt(MxParser.ForStmtContext ctx)
    {
        ExprNode init = ctx.init == null ? null : (ExprNode) visit(ctx.init);
        ExprNode cond = ctx.cond == null ? null : (ExprNode) visit(ctx.cond);
        ExprNode step = ctx.step == null ? null : (ExprNode) visit(ctx.step);
        StmtNode stmt = (StmtNode) visit(ctx.statement());
        if (!(stmt instanceof  BlockStmtNode))
            stmt = new BlockStmtNode(new Position(ctx.getStart()), stmt);
        return new ForStmtNode(new Position(ctx.getStart()), init, cond, step, stmt);
    }

    @Override
    public ASTNode visitNewExpr(MxParser.NewExprContext ctx)
    {
        return visit(ctx.creator());
    }

    @Override
    public ASTNode visitThisExpr(MxParser.ThisExprContext ctx)
    {
        return new ThisExprNode(new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitArrayExpr(MxParser.ArrayExprContext ctx)
    {
        return new ArrayExprNode(new Position(ctx.getStart()),
                (ExprNode) visit(ctx.array), (ExprNode) visit(ctx.sub));
    }

    @Override
    public ASTNode visitFunctionCallExpr(MxParser.FunctionCallExprContext ctx)
    {
        ExprNode func = (ExprNode) visit(ctx.expression());
        List<ExprNode> parameterList = new ArrayList<>();
        if (ctx.expressionList() != null)
        {
            for (var parameter : ctx.expressionList().expression())
            {
                parameterList.add((ExprNode) visit(parameter));
            }
        }
        return new FuncCallExprNode(new Position(ctx.getStart()), func, parameterList);
    }

    @Override
    public ASTNode visitMemberExpr(MxParser.MemberExprContext ctx)
    {
        return new MemberExprNode(new Position(ctx.getStart()),
                (ExprNode) visit(ctx.expression()), ctx.Identifier().getText());
    }

    @Override
    public ASTNode visitBinaryExpr(MxParser.BinaryExprContext ctx)
    {
        BinaryExprNode.Op op;
        switch (ctx.op.getText())
        {
            case "*":
                op = BinaryExprNode.Op.MUL;
                break;
            case "/":
                op = BinaryExprNode.Op.DIV;
                break;
            case "%":
                op = BinaryExprNode.Op.MOD;
                break;
            case "+":
                op = BinaryExprNode.Op.ADD;
                break;
            case "-":
                op = BinaryExprNode.Op.SUB;
                break;
            case "<<":
                op = BinaryExprNode.Op.SHL;
                break;
            case ">>":
                op = BinaryExprNode.Op.SHR;
                break;
            case "<=":
                op = BinaryExprNode.Op.LEQ;
                break;
            case ">=":
                op = BinaryExprNode.Op.REQ;
                break;
            case "<":
                op = BinaryExprNode.Op.LT;
                break;
            case ">":
                op = BinaryExprNode.Op.RT;
                break;
            case "==":
                op = BinaryExprNode.Op.EQ;
                break;
            case "!=":
                op = BinaryExprNode.Op.NEQ;
                break;
            case "&":
                op = BinaryExprNode.Op.AND;
                break;
            case "^":
                op = BinaryExprNode.Op.XOR;
                break;
            case "|":
                op = BinaryExprNode.Op.OR;
                break;
            case "&&":
                op = BinaryExprNode.Op.ANDI;
                break;
            case "||":
                op = BinaryExprNode.Op.ORI;
                break;
            default: op = null;
        }
        return new BinaryExprNode(new Position(ctx.getStart()),
                op, (ExprNode) visit(ctx.lhs), (ExprNode) visit(ctx.rhs));
    }

    @Override
    public ASTNode visitPostFixExpr(MxParser.PostFixExprContext ctx)
    {
        UnaryExprNode.Op op;
        if (ctx.op.getText().equals("++")) op = UnaryExprNode.Op.ADDS;
        else op = UnaryExprNode.Op.SUBS;
        return new UnaryExprNode(new Position(ctx.getStart()), op, (ExprNode) visit(ctx.expression()));
    }

    @Override
    public ASTNode visitSubExpr(MxParser.SubExprContext ctx)
    {
        return visit(ctx.expression());
    }

    @Override
    public ASTNode visitUnaryExpr(MxParser.UnaryExprContext ctx)
    {
        UnaryExprNode.Op op;
        switch (ctx.op.getText())
        {
            case "++":
                op = UnaryExprNode.Op.ADDP;
                break;
            case "--":
                op = UnaryExprNode.Op.SUBP;
                break;
            case "+":
                op = UnaryExprNode.Op.POS;
                break;
            case "-":
                op = UnaryExprNode.Op.NEG;
                break;
            case "!":
                op = UnaryExprNode.Op.NOTI;
                break;
            case "~":
                op = UnaryExprNode.Op.NOT;
                break;
            default: op = null;
        }
        return new UnaryExprNode(new Position(ctx.getStart()), op, (ExprNode) visit(ctx.expression()));
    }

    @Override
    public ASTNode visitIdExpr(MxParser.IdExprContext ctx)
    {
        return new IdExprNode(new Position(ctx.getStart()), ctx.Identifier().getText());
    }

    @Override
    public ASTNode visitConstExpr(MxParser.ConstExprContext ctx)
    {
        return visit(ctx.constant());
    }

    @Override
    public ASTNode visitAssignExpr(MxParser.AssignExprContext ctx)
    {
        return new BinaryExprNode(new Position(ctx.getStart()),
                BinaryExprNode.Op.ASS, (ExprNode) visit(ctx.lhs), (ExprNode) visit(ctx.rhs));
    }

    @Override
    public ASTNode visitExpressionList(MxParser.ExpressionListContext ctx)
    {
        return null;
    }

    @Override
    public ASTNode visitErrorCreator(MxParser.ErrorCreatorContext ctx)
    {
        TypeNode type = (TypeNode) visit(ctx.nonArraytype());
        syntaxErrorHandler.syntaxError(new Position(ctx.getStart()), "Invalid new expression!");
        return new NewExprNode(new Position(ctx.getStart()), type, -1, null);
        //throw new SyntaxError(new Position(ctx.getStart()), "Invalid new expression");
        //DONE: ERROR - invalid expression
    }

    @Override
    public ASTNode visitArrayCreator(MxParser.ArrayCreatorContext ctx)
    {
        List<ExprNode> exprList = new ArrayList<>();
        for (var expr : ctx.expression())
        {
            exprList.add((ExprNode) visit(expr));
        }
        int dims = (ctx.getChildCount() - ctx.expression().size() - 1) / 2;
        return new NewExprNode(new Position(ctx.getStart()), (TypeNode) visit(ctx.nonArraytype()),
                dims, exprList);
    }

    @Override
    public ASTNode visitClassCreator(MxParser.ClassCreatorContext ctx)
    {
        return new NewExprNode(new Position(ctx.getStart()), (TypeNode) visit(ctx.nonArraytype()),
                0, new ArrayList<>());
    }

    @Override
    public ASTNode visitNArrayCreator(MxParser.NArrayCreatorContext ctx)
    {
        return new NewExprNode(new Position(ctx.getStart()), (TypeNode) visit(ctx.nonArraytype()),
                0, new ArrayList<>());
    }

    @Override
    public ASTNode visitIntConst(MxParser.IntConstContext ctx)
    {
        return new IntConstNode(new Position(ctx.getStart()), Integer.parseInt(ctx.IntegerConst().getText()));
    }

    @Override
    public ASTNode visitBoolConst(MxParser.BoolConstContext ctx)
    {
        return new BoolConstNode(new Position(ctx.getStart()), Boolean.parseBoolean(ctx.BoolConst().getText()));
    }

    @Override
    public ASTNode visitStrConst(MxParser.StrConstContext ctx)
    {
        return new StringConstNode(new Position(ctx.getStart()), ctx.StringConst().getText());
    }

    @Override
    public ASTNode visitNullConst(MxParser.NullConstContext ctx)
    {
        return new NullConstNode(new Position(ctx.getStart()));
    }
}
