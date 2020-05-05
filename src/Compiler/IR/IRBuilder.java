package Compiler.IR;

import Compiler.AST.*;
import Compiler.IR.IRInstruction.*;
import Compiler.IR.Operand.*;
import Compiler.Type.*;
import Compiler.Utils.SemanticError;
import Compiler.Utils.Width;

import java.util.ArrayList;
import java.util.List;

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

    @Override
    public void visit(ProgramNode node) throws SemanticError
    {
        globalScope.IRInitializer(irRoot);
        for (ProgramDeclNode declNode : node.getProgramDeclNodeList())
        {
            if (declNode instanceof FuncDeclNode)
            {
                FunctionSymbol functionSymbol = ((FuncDeclNode) declNode).getFunctionSymbol();
                functionSymbol.setFunction(new Function(functionSymbol.getTypeName()));
            } else if (declNode instanceof ClassDeclNode)
            {
                if (((ClassDeclNode) declNode).getConstructorDecl() != null)
                {
                    FuncDeclNode constructorDecl = ((ClassDeclNode) declNode).getConstructorDecl();
                    FunctionSymbol functionSymbol = constructorDecl.getFunctionSymbol();
                    Function function = new Function(((ClassDeclNode) declNode).getClassSymbol().getTypeName() + ".Constructor");
                    functionSymbol.setFunction(function);
                }
                for (FuncDeclNode funcDeclNode : ((ClassDeclNode) declNode).getFuncDeclList())
                {
                    FunctionSymbol functionSymbol = funcDeclNode.getFunctionSymbol();
                    Function function = new Function(((ClassDeclNode) declNode).getClassSymbol().getTypeName() + "."
                            + functionSymbol.getTypeName());
                    functionSymbol.setFunction(function);
                }
            } else if (declNode instanceof VarDeclNode)
            {
                declNode.accept(this);
            }
        }

        for (ProgramDeclNode declNode : node.getProgramDeclNodeList())
        {
            if ((declNode instanceof FuncDeclNode) || (declNode instanceof ClassDeclNode))
                declNode.accept(this);
        }

        for (Function function : irRoot.getFunctionMap().values())
        {
            function.updateCallee();
        }
        irRoot.updateRecursiveCallee();
    }

    //Decl
    @Override
    public void visit(VarDeclNode node) throws SemanticError
    {
        VariableSymbol variableSymbol = node.getVariableSymbol();
        if (!variableSymbol.isUnUsed())
        {
            if (!variableSymbol.isGlobal())
            {
                VirtualRegister virtualRegister = new Value(node.getId());
                variableSymbol.setVariableOperand(virtualRegister);
                if (currentFunction != null && node.isParameterVar())
                {
                    virtualRegister.isParameter = true;
                    currentFunction.addParameterList(virtualRegister);
                }
                if (node.getExpr() != null)
                {
                    assign(virtualRegister, node.getExpr());
                }
            } else //isGlobal
            {
                GlobalVariable globalVariable = new GlobalVariable(node.getId());
                irRoot.addGlobalVariable(globalVariable);
                variableSymbol.setVariableOperand(globalVariable);
            }
        }
    }

    @Override
    public void visit(ClassDeclNode node) throws SemanticError
    {
        currentClassSymbol = node.getClassSymbol();
        if (node.getConstructorDecl() != null)
            node.getConstructorDecl().accept(this);
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
        irRoot.addFunction(currentFunction);

        if (functionSymbol.isMemberFunction())
        {
            currentFunction.setInClassThis();
        }

        currentBlock = currentFunction.getEntryBlock();

        for (VarDeclNode varDeclNode : node.getParameterList())
        {
            varDeclNode.accept(this);
        }
        node.getBlock().accept(this);

        //default return
        if (!currentBlock.isEnded())
        {
            if (functionSymbol.getType().getTypeName().equals("void") || node.getType() == null)
                currentBlock.endThis(new Return(currentBlock, null));
            else currentBlock.endThis(new Return(currentBlock, new Immediate(0)));
        }

        if (currentFunction.getReturnList().size() == 1)
        {
            currentFunction.setExitBlock(currentFunction.getReturnList().get(0).getCurrentBlock());
        } else {    //Merge the return list
            Operand returnOperand = null;
            if (!(functionSymbol.getType().getTypeName().equals("void") || node.getType() == null))
                returnOperand = new Value("returnVal");
            BasicBlock exitBlock = currentFunction.getExitBlock();
            List<Return> newReturnList = new ArrayList<>(currentFunction.getReturnList());
            for (Return ret : newReturnList)
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
        BasicBlock thenBlock = new BasicBlock(currentFunction, "_if_then");
        BasicBlock elseBlock = null;
        BasicBlock mergeBlock = new BasicBlock(currentFunction, "_if_merge");

        node.getExpr().setBodyBlock(thenBlock);
        if (node.getElseStmt() == null)
        {
            node.getExpr().setAfterBodyBlock(mergeBlock);
        } else
        {
            elseBlock = new BasicBlock(currentFunction, "_if_else");
            node.getExpr().setAfterBodyBlock(elseBlock);
        }
        node.getExpr().accept(this);

        currentBlock = thenBlock;
        node.getThenStmt().accept(this);
        if (!currentBlock.isEnded()) currentBlock.endThis(new Jump(currentBlock, mergeBlock));

        if (node.getElseStmt() != null)
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
        BasicBlock bodyBlock = new BasicBlock(currentFunction, "_for_body");
        BasicBlock condBlock = node.getCond() == null ? bodyBlock : new BasicBlock(currentFunction, "_for_cond");
        BasicBlock stepBlock = node.getStep() == null ? condBlock : new BasicBlock(currentFunction, "_for_step");
        BasicBlock mergeBlock = new BasicBlock(currentFunction, "_for_merge");

        node.setMergedBlock(mergeBlock);
        node.setStepBlock(stepBlock);

        if (node.getInit() != null)
        {
            node.getInit().accept(this);
        }
        if (!currentBlock.isEnded()) currentBlock.endThis(new Jump(currentBlock, condBlock));

        if (node.getCond() != null)
        {
            currentBlock = condBlock;
            node.getCond().setBodyBlock(bodyBlock);
            node.getCond().setAfterBodyBlock(mergeBlock);
            node.getCond().accept(this);
        }

        currentBlock = bodyBlock;
        node.getStatement().accept(this);
        if (!currentBlock.isEnded()) currentBlock.endThis(new Jump(currentBlock, stepBlock));

        if (node.getStep() != null)
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
        BasicBlock condBlock = new BasicBlock(currentFunction, "_while_cond");
        BasicBlock bodyBlock = new BasicBlock(currentFunction, "_while_body");
        BasicBlock mergeBlock = new BasicBlock(currentFunction, "_while_merge");

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
        FunctionSymbol functionSymbol = node.getFunctionExpr().getFunctionSymbol();
        node.getFunctionExpr().accept(this);
        if (functionSymbol.isMemberFunction() && functionSymbol.getTypeName().equals("array.size"))
        {
//            node.getFunctionExpr().accept(this);
            Operand operand = node.getFunctionExpr().getResultOperand();
            node.setResultOperand(new Value());
            currentBlock.addInst2Tail(new Load(currentBlock, operand, node.getResultOperand(), Width.regWidth, 0));
            return;
        }
//        System.out.println("functionSymbol name " + functionSymbol.getName());
        if (node.getTypeResolved().getTypeName().equals("void")) node.setResultOperand(null);
        else node.setResultOperand(new Value());
        Call call = new Call(currentBlock, functionSymbol.getFunction(), node.getResultOperand());
        if (functionSymbol.getFunction().getBuiltinName() == null)
        {
            for (int i = 0; i < node.getParameterList().size(); i++)
            {
                if (((FuncDeclNode)functionSymbol.getOrigin()).getParameterList().get(i).getVariableSymbol().isUnUsed()) continue;
                ExprNode exprNode = node.getParameterList().get(i);
                exprNode.accept(this);
                call.addParameterList(resolvePointer(currentBlock, exprNode.getResultOperand()));
            }
        } else
        {
            for (ExprNode exprNode : node.getParameterList())
            {
                exprNode.accept(this);
                call.addParameterList(resolvePointer(currentBlock, exprNode.getResultOperand()));
            }
        }
        if (functionSymbol.isMemberFunction())
        {
            call.setPointer(node.getFunctionExpr().getResultOperand());
        }
        functionSymbol.getFunction().callInstructionList.add(call);
        currentBlock.addInst2Tail(call);

        if (node.getBodyBlock() != null)
        {
            currentBlock.endThis(new Branch(currentBlock,
                    resolvePointer(currentBlock, node.getResultOperand()),
                    node.getBodyBlock(), node.getAfterBodyBlock()));
        }
    }

    @Override
    public void visit(MemberExprNode node) throws SemanticError
    {
        node.getExpr().accept(this);
        Operand baseClass = resolvePointer(currentBlock, node.getExpr().getResultOperand());
        if ((!node.getExpr().canAccess()) || (!(node.getMember() instanceof VariableSymbol))) node.setResultOperand(baseClass);
        else
        {
            Pointer pointer = new Pointer();
            Symbol symbol = node.getMember();
            currentBlock.addInst2Tail(new Binary(currentBlock, Binary.Op.ADD, baseClass,
                    new Immediate(((VariableSymbol) symbol).getOffset()), pointer));
            node.setResultOperand(pointer);
            if (node.getBodyBlock() != null)
            {
                Value value = new Value();
                currentBlock.addInst2Tail(new Load(currentBlock, pointer, value, Width.regWidth, 0));
                currentBlock.endThis(new Branch(currentBlock, value, node.getBodyBlock(), node.getAfterBodyBlock()));
            }
        }
    }

    @Override
    public void visit(ArrayExprNode node) throws SemanticError
    {
        node.getArray().accept(this);
        node.getIndex().accept(this);
        Operand arrayBase = resolvePointer(currentBlock, node.getArray().getResultOperand());
        Operand arrayIndex = resolvePointer(currentBlock, node.getIndex().getResultOperand());
        Pointer pointer = new Pointer();
        node.setResultOperand(pointer);
        Value offset = new Value();
        if (((ArraySymbol) node.getArray().getTypeResolved()).getDims() > 1)
        {
            currentBlock.addInst2Tail(new Binary(currentBlock, Binary.Op.MUL, arrayIndex, new Immediate(Width.pointerWidth), offset));
        } else
        {
            ArraySymbol arraySymbol = (ArraySymbol) node.getArray().getTypeResolved();
            currentBlock.addInst2Tail(new Binary(currentBlock, Binary.Op.MUL, arrayIndex, new Immediate(arraySymbol.getType().getTypeSize()), offset));
        }
        Value offsetNew = new Value();
        currentBlock.addInst2Tail(new Binary(currentBlock, Binary.Op.ADD, offset, new Immediate(Width.regWidth), offsetNew));
        currentBlock.addInst2Tail(new Binary(currentBlock, Binary.Op.ADD, offsetNew, arrayBase, pointer)); //YES?

        if (node.getBodyBlock() != null)
        {
            Value value = new Value();
            currentBlock.addInst2Tail(new Load(currentBlock, pointer, value, Width.regWidth, 0));
            currentBlock.endThis(new Branch(currentBlock, value, node.getBodyBlock(), node.getAfterBodyBlock()));
        }
    }

    @Override
    public void visit(NewExprNode node) throws SemanticError
    {
        Value value = new Value();
        node.setResultOperand(value);
        if (node.getDims() > 0)
        {
            arrayAllocate(node, value, 0);
            return;
        }
        ClassSymbol classSymbol = (ClassSymbol) node.getTypeResolved();
        currentBlock.addInst2Tail(new Alloc(currentBlock,
                new Immediate(classSymbol.getClassSize()), value));
        if (classSymbol.getConstructor() != null)
        {
            Call call = new Call(currentBlock, classSymbol.getConstructor().getFunction(), null);
            call.setPointer(value);
            classSymbol.getConstructor().getFunction().callInstructionList.add(call);
            currentBlock.addInst2Tail(call);
        }
    }

    @Override
    public void visit(UnaryExprNode node) throws SemanticError
    {
        ExprNode src = node.getExpr();
        switch (node.getOp())
        {
            case ADDP:{
                src.accept(this);
                Operand operand = src.getResultOperand();
                Operand value = resolvePointer(currentBlock, operand);
                Operand dst = (operand instanceof Pointer) ? new Value() : value;
                currentBlock.addInst2Tail(new Binary(currentBlock, Binary.Op.ADD, value, new Immediate(1), dst));
                if (operand instanceof Pointer)  currentBlock.addInst2Tail(new Store(currentBlock, dst, operand, Width.regWidth, 0));
                node.setResultOperand(operand);
                break;
            }
            case SUBP:{
                src.accept(this);
                Operand operand = src.getResultOperand();
                Operand value = resolvePointer(currentBlock, operand);
                Operand dst = (operand instanceof Pointer) ? new Value() : value;
                currentBlock.addInst2Tail(new Binary(currentBlock, Binary.Op.SUB, value, new Immediate(1), dst));
                if (operand instanceof Pointer)  currentBlock.addInst2Tail(new Store(currentBlock, dst, operand, Width.regWidth, 0));
                node.setResultOperand(operand);
                break;
            }
            case ADDS:{
                src.accept(this);
                Operand operand = src.getResultOperand();
                if (operand instanceof Pointer)
                {
                    Operand value = resolvePointer(currentBlock, operand);
                    Value dst = new Value();
                    currentBlock.addInst2Tail(new Binary(currentBlock, Binary.Op.ADD, value, new Immediate(1), dst));
                    currentBlock.addInst2Tail(new Store(currentBlock, dst, operand, Width.regWidth, 0));
                    node.setResultOperand(value);
                } else if (operand instanceof Value)
                {
                    Value dst = new Value();
                    currentBlock.addInst2Tail(new Move(currentBlock, operand, dst));
                    currentBlock.addInst2Tail(new Binary(currentBlock, Binary.Op.ADD, operand, new Immediate(1), operand));
                    node.setResultOperand(dst);
                }
                break;
            }
            case SUBS:{
                src.accept(this);
                Operand operand = src.getResultOperand();
                if (operand instanceof Pointer)
                {
                    Operand value = resolvePointer(currentBlock, operand);
                    Value dst = new Value();
                    currentBlock.addInst2Tail(new Binary(currentBlock, Binary.Op.SUB, value, new Immediate(1), dst));
                    currentBlock.addInst2Tail(new Store(currentBlock, dst, operand, Width.regWidth, 0));
                    node.setResultOperand(value);
                } else if (operand instanceof Value)
                {
                    Value dst = new Value();
                    currentBlock.addInst2Tail(new Move(currentBlock, operand, dst));
                    currentBlock.addInst2Tail(new Binary(currentBlock, Binary.Op.SUB, operand, new Immediate(1), operand));
                    node.setResultOperand(dst);
                }
                break;
            }
            case NOT:{
                src.accept(this);
                Operand operand = src.getResultOperand();
                Operand value = resolvePointer(currentBlock, operand);
                Value dst = new Value();
                currentBlock.addInst2Tail(new Unary(currentBlock, Unary.Op.NOT, value, dst));
                node.setResultOperand(dst);
                break;
            }
            case NEG:{
                src.accept(this);
                Operand operand = src.getResultOperand();
                Operand value = resolvePointer(currentBlock, operand);
                Value dst = new Value();
                currentBlock.addInst2Tail(new Unary(currentBlock, Unary.Op.NEG, value, dst));
                node.setResultOperand(dst);
                break;
            }
            case NOTI:{
                if (node.getBodyBlock() != null)
                {
                    src.setBodyBlock(node.getAfterBodyBlock());
                    src.setAfterBodyBlock(node.getBodyBlock());
                    src.accept(this);
                } else
                {
                    Value dst = new Value();
                    node.setResultOperand(dst);
                    assign(dst, node);
                }
                break;
            }
            case POS:{
                src.accept(this);
                Operand value = resolvePointer(currentBlock, src.getResultOperand());
                node.setResultOperand(value);
                break;
            }
            default:
                break;
        }
    }

    @Override
    public void visit(BinaryExprNode node) throws SemanticError
    {
        ExprNode lhs = node.getLhs();
        ExprNode rhs = node.getRhs();
        Binary.Op op_bin = Binary.Op.ADD;
        Cmp.Op op_cmp = Cmp.Op.EQ;
        Function function_call = irRoot.builtinStringEQ;
        switch (node.getOp())
        {
            case MUL:
                op_bin = Binary.Op.MUL;
                break;
            case DIV:
                op_bin = Binary.Op.DIV;
                break;
            case MOD:
                op_bin = Binary.Op.MOD;
                break;
            case ADD:
                op_bin = Binary.Op.ADD;
                break;
            case SUB:
                op_bin = Binary.Op.SUB;
                break;
            case SHL:
                op_bin = Binary.Op.SHL;
                break;
            case SHR:
                op_bin = Binary.Op.SHR;
                break;
            case LEQ:
                op_cmp = Cmp.Op.LEQ;
                function_call = irRoot.builtinStringLEQ;
                break;
            case REQ:
                op_cmp = Cmp.Op.REQ;
                function_call = irRoot.builtinStringREQ;
                break;
            case LT:
                op_cmp = Cmp.Op.LT;
                function_call = irRoot.builtinStringLT;
                break;
            case RT:
                op_cmp = Cmp.Op.RT;
                function_call = irRoot.builtinStringRT;
                break;
            case EQ:
                op_cmp = Cmp.Op.EQ;
                function_call = irRoot.builtinStringEQ;
                break;
            case NEQ:
                op_cmp = Cmp.Op.NEQ;
                function_call = irRoot.builtinStringNEQ;
                break;
            case AND:
                op_bin = Binary.Op.AND;
                break;
            case XOR:
                op_bin = Binary.Op.XOR;
                break;
            case OR:
                op_bin = Binary.Op.OR;
                break;
            case ANDI:
            case ORI:
            case ASS:
            default:
                break;
        }

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
            case OR:
            {
                lhs.accept(this);
                rhs.accept(this);
                Operand lvalue = resolvePointer(currentBlock, lhs.getResultOperand());
                Operand rvalue = resolvePointer(currentBlock, rhs.getResultOperand());
                Operand dst = new Value();
                currentBlock.addInst2Tail(new Binary(currentBlock, op_bin, lvalue, rvalue, dst));
                node.setResultOperand(dst);
                break;
            }
            case ADD:
            {
                lhs.accept(this);
                rhs.accept(this);
                Operand lvalue = resolvePointer(currentBlock, lhs.getResultOperand());
                Operand rvalue = resolvePointer(currentBlock, rhs.getResultOperand());
                if (lhs.isString())
                {
                    Operand dst = new Value();
                    Call call = new Call(currentBlock, irRoot.builtinStringAdd, dst);
                    call.addParameterList(lvalue);
                    call.addParameterList(rvalue);
                    currentBlock.addInst2Tail(call);
                    node.setResultOperand(dst);
                } else
                {
                    Operand dst = new Value();
                    currentBlock.addInst2Tail(new Binary(currentBlock, op_bin, lvalue, rvalue, dst));
                    node.setResultOperand(dst);
                }
                break;
            }
            case LEQ:
            case REQ:
            case LT:
            case RT:
            case EQ:
            case NEQ:
            {
                lhs.accept(this);
                rhs.accept(this);
                Operand lvalue = resolvePointer(currentBlock, lhs.getResultOperand());
                Operand rvalue = resolvePointer(currentBlock, rhs.getResultOperand());
                if (lhs.isString())
                {
                    Operand dst = new Value();
                    Call call = new Call(currentBlock, function_call, dst);
                    call.addParameterList(lvalue);
                    call.addParameterList(rvalue);
                    currentBlock.addInst2Tail(call);
                    node.setResultOperand(dst);
                } else
                {
                    Operand dst = new Value();
                    currentBlock.addInst2Tail(new Cmp(currentBlock, op_cmp, lvalue, rvalue, dst));
                    node.setResultOperand(dst);
                }
                if (node.getBodyBlock() != null)
                    currentBlock.endThis(new Branch(currentBlock, node.getResultOperand(), node.getBodyBlock(), node.getAfterBodyBlock()));
                break;
            }
            case ANDI:
            {
                if (node.getBodyBlock() != null)
                {
                    lhs.setBodyBlock(new BasicBlock(currentFunction, "_lhs_and_then"));
                    lhs.setAfterBodyBlock(node.getAfterBodyBlock());
                    lhs.accept(this);
                    currentBlock = lhs.getBodyBlock();
                    rhs.setBodyBlock(node.getBodyBlock());
                    rhs.setAfterBodyBlock(node.getAfterBodyBlock());
                    rhs.accept(this);
                } else {
                    Operand dst = new Value();
                    node.setResultOperand(dst);
                    assign(dst, node);
                }
                break;
            }
            case ORI:
            {
                if (node.getBodyBlock() != null)
                {
                    lhs.setBodyBlock(node.getBodyBlock());
                    lhs.setAfterBodyBlock(new BasicBlock(currentFunction, "_lhs_or_else"));
                    lhs.accept(this);
                    currentBlock = lhs.getAfterBodyBlock();
                    rhs.setBodyBlock(node.getBodyBlock());
                    rhs.setAfterBodyBlock(node.getAfterBodyBlock());
                    rhs.accept(this);
                } else {
                    Operand dst = new Value();
                    node.setResultOperand(dst);
                    assign(dst, node);
                }
                break;
            }
            case ASS:{
                lhs.accept(this);
                assign(lhs.getResultOperand(), rhs);
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
//        if (symbol instanceof VariableSymbol)
//        {
//            if (((VariableSymbol) symbol).isUnUsed())
//            {
//                System.out.println("unused in id!");
//                return;
//            }
//        }
        if (symbol instanceof VariableSymbol)
        {
            if (symbol.getScope() == currentClassSymbol)
            {
                Pointer pointer = new Pointer();
                currentBlock.addInst2Tail(new Binary(currentBlock, Binary.Op.ADD,
                        currentFunction.getInClassThis(), new Immediate(((VariableSymbol) symbol).getOffset()), pointer));
                node.setResultOperand(pointer);
                if (node.getBodyBlock() != null)
                {
                    Value value = new Value();
                    currentBlock.addInst2Tail(new Load(currentBlock, pointer, value, Width.regWidth, 0));
                    currentBlock.endThis(new Branch(currentBlock, value, node.getBodyBlock(), node.getAfterBodyBlock()));
                }
            } else {
                node.setResultOperand(((VariableSymbol) symbol).getVariableOperand());
                if (node.getBodyBlock() != null)
                    currentBlock.endThis(new Branch(currentBlock, ((VariableSymbol) symbol).getVariableOperand(),
                            node.getBodyBlock(), node.getAfterBodyBlock()));
            }
        } else
        {
            node.setResultOperand(currentFunction.getInClassThis());
        }
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
        StaticStr staticStr = new StaticStr(new GlobalVariable("__str_const_" + (++irRoot.stringConstCnt), true), node.getVal());
        node.setResultOperand(staticStr.getBase());
        irRoot.addStaticStr(staticStr);
//        irRoot.addStaticStringVal(staticStr.getBase(), staticStr.getValue());
    }

    @Override
    public void visit(IntConstNode node) throws SemanticError
    {
        node.setResultOperand(new Immediate(node.getVal()));
    }

    @Override
    public void visit(BoolConstNode node) throws SemanticError
    {
        int imm = node.getVal() ? 1 : 0;
        node.setResultOperand(new Immediate(imm));
        if (node.getBodyBlock() != null)
        {
            if (imm == 1) currentBlock.endThis(new Jump(currentBlock, node.getBodyBlock()));
            else currentBlock.endThis(new Jump(currentBlock, node.getAfterBodyBlock()));
        }
    }

    public void assign(Operand lhs, ExprNode rhs) throws SemanticError
    {
        if (rhs.isBool() && !(rhs instanceof BoolConstNode))
        {
            BasicBlock thenBlock = new BasicBlock(currentFunction, "_bool_then");
            BasicBlock elseBlock = new BasicBlock(currentFunction, "_bool_else");
            BasicBlock mergeBlock = new BasicBlock(currentFunction, "_bool_merge");
            rhs.setBodyBlock(thenBlock);
            rhs.setAfterBodyBlock(elseBlock);
            rhs.accept(this);
            if (lhs instanceof Pointer)
            {
                thenBlock.addInst2Tail(new Store(thenBlock, new Immediate(1), lhs, Width.regWidth, 0));
                elseBlock.addInst2Tail(new Store(elseBlock, new Immediate(0), lhs, Width.regWidth, 0));
            } else {
                thenBlock.addInst2Tail(new Move(thenBlock, new Immediate(1), lhs));
                elseBlock.addInst2Tail(new Move(elseBlock, new Immediate(0), lhs));
            }
            thenBlock.endThis(new Jump(thenBlock, mergeBlock));
            elseBlock.endThis(new Jump(elseBlock, mergeBlock));
            currentBlock = mergeBlock;
        } else
        {
            rhs.accept(this);
            Operand operand = rhs.getResultOperand();
            if (operand instanceof Pointer)
            {
                Value dst = new Value();
                currentBlock.addInst2Tail(new Load(currentBlock, operand, dst, Width.regWidth, 0));
                if (lhs instanceof Pointer)
                {
                    currentBlock.addInst2Tail(new Store(currentBlock, dst, lhs, Width.regWidth, 0));
                }
                else {
                    currentBlock.addInst2Tail(new Move(currentBlock, dst, lhs));
                }
            } else
            {
                if (lhs instanceof Pointer)
                {
                    currentBlock.addInst2Tail(new Store(currentBlock, operand, lhs, Width.regWidth, 0));
                }
                else {
                    currentBlock.addInst2Tail(new Move(currentBlock, operand, lhs));
                }
            }
        }
    }

    public void arrayAllocate(NewExprNode node, Operand operand, int times) throws SemanticError
    {
        if (times == node.getExprList().size()) return;
        ExprNode exprNode = node.getExprList().get(times);
        exprNode.accept(this);
        Operand index = resolvePointer(currentBlock, exprNode.getResultOperand());
        Value size = new Value();

        int mulWidth = Width.pointerWidth;
        if ((times == node.getExprList().size() - 1) && (times == node.getDims() - 1))
            mulWidth = node.getTypeResolved().getTypeSize();
        currentBlock.addInst2Tail(new Binary(currentBlock, Binary.Op.MUL, index, new Immediate(mulWidth), size));
        currentBlock.addInst2Tail(new Binary(currentBlock, Binary.Op.ADD, size, new Immediate(Width.regWidth), size));
        Value dst = new Value();
        if (operand instanceof Pointer)
        {
            currentBlock.addInst2Tail(new Alloc(currentBlock, size, dst));
            currentBlock.addInst2Tail(new Store(currentBlock, index, dst, Width.regWidth, 0));
            currentBlock.addInst2Tail(new Store(currentBlock, dst, operand, Width.regWidth, 0));
        } else
        {
            currentBlock.addInst2Tail(new Alloc(currentBlock, size, operand));
            currentBlock.addInst2Tail(new Store(currentBlock, index, operand, Width.regWidth, 0));
        }

        if (times < node.getExprList().size() - 1)
        {
            //allocate using loop
            BasicBlock bodyBlock = new BasicBlock(currentFunction, "_array_loop_body");
            BasicBlock condBlock = new BasicBlock(currentFunction, "_array_loop_cond");
            BasicBlock stepBlock = new BasicBlock(currentFunction, "_array_loop_step");
            BasicBlock mergeBlock = new BasicBlock(currentFunction, "_array_loop_merge");
            //init
            Pointer initPointer = new Pointer();
            Pointer endPointer = new Pointer();
            if (operand instanceof Pointer)
            {
                currentBlock.addInst2Tail(new Binary(currentBlock, Binary.Op.ADD, dst, new Immediate(Width.regWidth), initPointer));
                currentBlock.addInst2Tail(new Binary(currentBlock, Binary.Op.ADD, dst, size, endPointer));
            } else
            {
                currentBlock.addInst2Tail(new Binary(currentBlock, Binary.Op.ADD, operand, new Immediate(Width.regWidth), initPointer));
                currentBlock.addInst2Tail(new Binary(currentBlock, Binary.Op.ADD, operand, size, endPointer));
            }
            currentBlock.endThis(new Jump(currentBlock, condBlock));
            //cond
            currentBlock = condBlock;
            Value cmpValue = new Value();
            currentBlock.addInst2Tail(new Cmp(currentBlock, Cmp.Op.LT, initPointer, endPointer, cmpValue));
            currentBlock.endThis(new Branch(currentBlock, cmpValue, bodyBlock, mergeBlock));
            //body
            currentBlock = bodyBlock;
            arrayAllocate(node, initPointer, times + 1);
            currentBlock.endThis(new Jump(currentBlock, stepBlock));
            //step
            currentBlock = stepBlock;
            Pointer tmpPointer = new Pointer();
            currentBlock.addInst2Tail(new Binary(currentBlock, Binary.Op.ADD, initPointer, new Immediate(Width.regWidth), tmpPointer));
            currentBlock.addInst2Tail(new Move(currentBlock, tmpPointer, initPointer));
            currentBlock.endThis(new Jump(currentBlock, condBlock));
            //merge
            currentBlock = mergeBlock;
        }
    }

    public Operand resolvePointer(BasicBlock basicBlock, Operand operand)
    {
        if (operand instanceof Pointer)
        {
            Value value = new Value();
            currentBlock.addInst2Tail(new Load(basicBlock, operand, value, Width.regWidth, 0));
            return value;
        }
        else return operand;
    }
}
