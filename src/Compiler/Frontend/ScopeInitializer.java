package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Type.GlobalScope;
import Compiler.Type.PrimitiveTypeSymbol;
import Compiler.Utils.SemanticError;

import java.util.ArrayList;
import java.util.List;

public class ScopeInitializer
{
    private final static GlobalScope globalScope = new GlobalScope("GlobalScope");

    public ScopeInitializer(ProgramNode ast) throws SemanticError
    {
        globalScope.Initializer();

        //Build _init_
        List<StmtNode> stmtNodeList = new ArrayList<>();
        for (ProgramDeclNode programDeclNode : ast.getProgramDeclNodeList())
        {
            if (programDeclNode instanceof VarDeclNode)
            {
                if (((VarDeclNode) programDeclNode).getExpr() != null)
                {
                    stmtNodeList.add(new ExprStmtNode(programDeclNode.getPosition(),
                            new BinaryExprNode(programDeclNode.getPosition(), BinaryExprNode.Op.ASS,
                                    new IdExprNode(programDeclNode.getPosition(),
                                            ((VarDeclNode)programDeclNode).getId()),
                                    ((VarDeclNode)programDeclNode).getExpr())));
                }
            }
        }
        stmtNodeList.add(new ReturnStmtNode(null,
                new FuncCallExprNode(null,
                        new IdExprNode(null, "main"), new ArrayList<>())));
        BlockStmtNode blockStmtNode = new BlockStmtNode(null, stmtNodeList);
        FuncDeclNode initFuncDecl = new FuncDeclNode(null,
                new IntTypeNode(null), "_init_", new ArrayList<>(), blockStmtNode);
        ast.getProgramDeclNodeList().add(initFuncDecl);
    }

    public GlobalScope getGlobalScope()
    {
        return globalScope;
    }
}
