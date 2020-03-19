package Compiler.IR;

import Compiler.AST.*;
import Compiler.IR.IRInstruction.*;
import Compiler.IR.Operand.*;
import Compiler.Type.*;
import Compiler.Utils.SemanticError;

public class IRBuilder implements ASTVisitor
{
    private GlobalScope globalScope;
    private BasicBlock currentBlock;
    private ClassSymbol currentClassSymbol;
    private Function currentFunction;
    private IRRoot irRoot = new IRRoot();


    public IRBuilder(GlobalScope globalScope)
    {
        this.globalScope = globalScope;
    }

    public IRRoot getIrRoot()
    {
        return irRoot;
    }

    public void builtinFunctionInitializer() throws SemanticError
    {
        //string
        ((FunctionSymbol) globalScope.getString().resolveSymbol(null,"length")).setFunction(irRoot.builtinStringLength);
        ((FunctionSymbol) globalScope.getString().resolveSymbol(null,"substring")).setFunction(irRoot.builtinStringSubstring);
        ((FunctionSymbol) globalScope.getString().resolveSymbol(null,"parseInt")).setFunction(irRoot.builtinStringParseInt);
        ((FunctionSymbol) globalScope.getString().resolveSymbol(null,"ord")).setFunction(irRoot.builtinStringOrd);

        //function
        ((FunctionSymbol) globalScope.resolveSymbol(null, "print")).setFunction(irRoot.builtinPrint);
        ((FunctionSymbol) globalScope.resolveSymbol(null, "println")).setFunction(irRoot.builtinPrintln);
        ((FunctionSymbol) globalScope.resolveSymbol(null, "printInt")).setFunction(irRoot.builtinPrintInt);
        ((FunctionSymbol) globalScope.resolveSymbol(null, "printlnInt")).setFunction(irRoot.builtinPrintlnInt);
        ((FunctionSymbol) globalScope.resolveSymbol(null, "getString")).setFunction(irRoot.builtinGetString);
        ((FunctionSymbol) globalScope.resolveSymbol(null, "getInt")).setFunction(irRoot.builtinGetInt);
        ((FunctionSymbol) globalScope.resolveSymbol(null, "toString")).setFunction(irRoot.builtinToString);
    }

    @Override
    public void visit(ProgramNode node) throws SemanticError
    {
        builtinFunctionInitializer();
        //define Function
        for (ProgramDeclNode declNode : node.getProgramDeclNodeList())
        {
            if (declNode instanceof FuncDeclNode)
            {
                FunctionSymbol functionSymbol = ((FuncDeclNode) declNode).getFunctionSymbol();
                functionSymbol.setFunction(new Function(functionSymbol.getTypeName()));
            } else if (declNode instanceof ClassDeclNode)
            {
                for (FuncDeclNode funcDeclNode : ((ClassDeclNode) declNode).getFuncDeclList())
                {
                    FunctionSymbol functionSymbol = funcDeclNode.getFunctionSymbol();
                    Function function = new Function(((ClassDeclNode) declNode).getClassSymbol().getTypeName() + "."
                            + functionSymbol.getTypeName());
                    functionSymbol.setFunction(function);
                }
            }
        }

        //visit
        for (ProgramDeclNode declNode : node.getProgramDeclNodeList())
        {
            declNode.accept(this);
        }
    }

    //Decl
    @Override
    public void visit(VarDeclNode node) throws SemanticError
    {
        VariableSymbol variableSymbol = node.getVariableSymbol();
        if (!variableSymbol.isUnUsed())
        {
            if (variableSymbol.isGlobal())
            {
                VirtualRegister virtualRegister = new GlobalVariable(node.getId());
                irRoot.addGlobalVariable((GlobalVariable) virtualRegister);
                variableSymbol.setVariableOperand(virtualRegister);
            } else
            {
                VirtualRegister virtualRegister = new Value(node.getId());
                variableSymbol.setVariableOperand(virtualRegister);
                if (currentFunction != null && node.isParameterVar())
                    currentFunction.addParameterList(virtualRegister);
                if (node.getExpr() != null) assign(virtualRegister, node.getExpr());
            }
        }
    }

    @Override
    public void visit(ClassDeclNode node) throws SemanticError
    {
        currentClassSymbol = node.getClassSymbol();
        for (FuncDeclNode funcDeclNode : node.getFuncDeclList())
        {
            funcDeclNode.accept(this);
        }
        currentClassSymbol = null;
    }

    @Override
    public void visit(FuncDeclNode node) throws SemanticError
    {
        FunctionSymbol functionSymbol = node.getFunctionSymbol();
        currentFunction = functionSymbol.getFunction();
        if (functionSymbol.isMemberFunction()) currentFunction.setInClassThis(new Value("this"));
        irRoot.addFunction(currentFunction);

        currentBlock = currentFunction.getEntryBlock();

        for (VarDeclNode varDeclNode : node.getParameterList())
        {
            varDeclNode.accept(this);
        }
        node.getBlock().accept(this);

        //add return if don't have one
        if (!currentBlock.isEnded())
        {
            if (functionSymbol.getType().getTypeName().equals("void"))
                currentBlock.endThis(new Return(currentBlock, null));
            else currentBlock.endThis(new Return(currentBlock, new Immediate(0)));
        }

        if (currentFunction.getReturnList().size() == 1)
        {
            currentFunction.setExitBlock(currentFunction.getReturnList().get(0).getCurrentBlock());
        } else {    //Merge the return list
            Operand returnOperand = null;
            if (!functionSymbol.getType().getTypeName().equals("void")) returnOperand = new Value();
            BasicBlock exitBlock = currentFunction.getExitBlock();
            for (Return ret : currentFunction.getReturnList())
            {
                ret.getCurrentBlock().removeTailInst();
                if (ret.getReturnValue() != null)
                    ret.getCurrentBlock().addInst2Tail(new Move(ret.getCurrentBlock(), ret.getReturnValue(), returnOperand));
                ret.getCurrentBlock().endThis(new Jump(ret.getCurrentBlock(), exitBlock));
            }
            exitBlock.endThis(new Return(exitBlock, returnOperand));
        }

        currentFunction = null;
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
        for (StmtNode stmtNode : node.getStmtList())
        {
            stmtNode.accept(this);
            if (currentBlock.isEnded()) return;
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
        BasicBlock thenBlock = new BasicBlock(currentFunction, "if_then");
        BasicBlock elseBlock = node.getElseStmt() == null ? null : new BasicBlock(currentFunction, "if_else");
        BasicBlock mergeBlock = new BasicBlock(currentFunction, "if_merge");

        node.getExpr().setBodyBlock(thenBlock);
        node.getExpr().setAfterBodyBlock(elseBlock == null ? mergeBlock : elseBlock);
        node.getExpr().accept(this);

        currentBlock = thenBlock;
        node.getThenStmt().accept(this);
        if (!currentBlock.isEnded()) currentBlock.endThis(new Jump(currentBlock, mergeBlock));

        if (elseBlock != null)
        {
            currentBlock = elseBlock;
            node.getElseStmt().accept(this);
            if (!currentBlock.isEnded()) currentBlock.endThis(new Jump(currentBlock, mergeBlock));
        }

        currentBlock = mergeBlock;
    }

    @Override
    public void visit(ReturnStmtNode node) throws SemanticError
    {
        if (node.getExpr() != null)
        {
            Operand returnValue = new Value();
            assign(returnValue, node.getExpr());
            currentBlock.endThis(new Return(currentBlock, returnValue));
        } else
        {
            currentBlock.endThis(new Return(currentBlock, null));
        }
    }

    @Override
    public void visit(BreakStmtNode node) throws SemanticError
    {
        currentBlock.endThis(new Jump(currentBlock, node.getLoop().getMergedBlock()));
    }

    @Override
    public void visit(ContinueStmtNode node) throws SemanticError
    {
        currentBlock.endThis(new Jump(currentBlock, node.getLoop().getStepBlock()));
    }

    @Override
    public void visit(ForStmtNode node) throws SemanticError
    {
        BasicBlock condBlock = node.getCond() == null ? null : new BasicBlock(currentFunction, "for_cond");
        BasicBlock stepBlock = node.getStep() == null ? null : new BasicBlock(currentFunction, "for_step");
        BasicBlock bodyBlock = new BasicBlock(currentFunction, "for_body");
        BasicBlock mergeBlock = new BasicBlock(currentFunction, "for_merge");

        node.setMergedBlock(mergeBlock);
        node.setStepBlock(stepBlock);

        if (node.getInit() != null)
        {
            node.getInit().accept(this);
        }
        if (!currentBlock.isEnded()) currentBlock.endThis(new Jump(currentBlock, condBlock));

        if (condBlock != null)
        {
            currentBlock = condBlock;
            node.getCond().setBodyBlock(bodyBlock);
            node.getCond().setAfterBodyBlock(mergeBlock);
            node.getCond().accept(this);
        }

        currentBlock = bodyBlock;
        node.getStatement().accept(this);
        if (!currentBlock.isEnded()) currentBlock.endThis(new Jump(currentBlock, stepBlock));

        if (stepBlock != null)
        {
            currentBlock = stepBlock;
            node.getStep().accept(this);
            if (!currentBlock.isEnded()) currentBlock.endThis(new Jump(currentBlock, condBlock));
        }

        currentBlock = mergeBlock;
    }

    @Override
    public void visit(WhileStmtNode node) throws SemanticError
    {
        BasicBlock condBlock = new BasicBlock(currentFunction, "while_cond");
        BasicBlock bodyBlock = new BasicBlock(currentFunction, "while_body");
        BasicBlock mergeBlock = new BasicBlock(currentFunction, "while_merge");

        node.setMergedBlock(mergeBlock);
        node.setStepBlock(condBlock);

        currentBlock.endThis(new Jump(currentBlock, condBlock));

        currentBlock = condBlock;
        node.getExpr().setBodyBlock(bodyBlock);
        node.getExpr().setAfterBodyBlock(mergeBlock);
        node.getExpr().accept(this);

        currentBlock = bodyBlock;
        node.getStatement().accept(this);
        if (!currentBlock.isEnded()) currentBlock.endThis(new Jump(currentBlock, condBlock));

        currentBlock = mergeBlock;
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
        node.setResultOperand(currentFunction.getInClassThis());
    }

    //Const
    @Override
    public void visit(NullConstNode node) throws SemanticError
    {
        node.setResultOperand(new Immediate(0));
    }

    @Override
    public void visit(StringConstNode node) throws SemanticError
    {
        StaticStr staticStr = new StaticStr(new GlobalVariable("__str_const", true), node.getVal());
        node.setResultOperand(staticStr.getBase());
        irRoot.addStaticStr(staticStr);
    }

    @Override
    public void visit(IntConstNode node) throws SemanticError
    {
        node.setResultOperand(new Immediate(node.getVal()));
    }

    @Override
    public void visit(BoolConstNode node) throws SemanticError
    {
        node.setResultOperand(new Immediate(node.getVal() ? 1 : 0));
        if (node.getBodyBlock() != null)
        {
            if (node.getVal()) currentBlock.endThis(new Jump(currentBlock, node.getBodyBlock()));
            else currentBlock.endThis(new Jump(currentBlock, node.getAfterBodyBlock()));
        }
    }

    public void assign(Operand lhs, ExprNode rhs)
    {
        //TODO : A LOT
    }
}
