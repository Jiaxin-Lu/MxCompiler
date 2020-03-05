package Compiler.AST;

import Compiler.Type.FunctionSymbol;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

import java.util.List;

public class FuncDeclNode extends ProgramDeclNode
{
    private TypeNode type;
    private String id;
    private List<VarDeclNode> parameterList;
    private BlockStmtNode block;
    private FunctionSymbol functionSymbol;

    public FuncDeclNode(Position position, TypeNode type, String id,
                        List<VarDeclNode> parameterList, BlockStmtNode block)
    {
        super(position);
        this.type = type;
        this.id = id;
        this.parameterList = parameterList;
        this.block = block;
    }

    public TypeNode getType()
    {
        return type;
    }

    public String getId()
    {
        return id;
    }

    public List<VarDeclNode> getParameterList()
    {
        return parameterList;
    }

    public BlockStmtNode getBlock()
    {
        return block;
    }

    public FunctionSymbol getFunctionSymbol()
    {
        return functionSymbol;
    }

    public void setFunctionSymbol(FunctionSymbol functionSymbol)
    {
        this.functionSymbol = functionSymbol;
    }

    @Override
    public void accept(ASTVisitor visitor) throws SemanticError
    {
        visitor.visit(this);
    }
}