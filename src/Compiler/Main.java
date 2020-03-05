package Compiler;

import Compiler.AST.ProgramNode;
import Compiler.Frontend.*;
import Compiler.Parser.MxErrorListener;
import Compiler.Parser.MxLexer;
import Compiler.Parser.MxParser;
import Compiler.Type.GlobalScope;
import Compiler.Utils.*;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.FileInputStream;
import java.io.InputStream;

public class Main
{
    public static void main(String[] args) throws Exception
    {
        SyntaxErrorHandler syntaxErrorHandler = new SyntaxErrorHandler();
        InputStream inStream = new FileInputStream("code.txt");

        try
        {
            //Syntax
            MxParser parser = new MxParser(new CommonTokenStream(new MxLexer(CharStreams.fromStream(inStream))));
            parser.removeErrorListeners();
            parser.addErrorListener(new MxErrorListener(syntaxErrorHandler));
            if (syntaxErrorHandler.isHaveError())
            {
                throw new RuntimeException();
            }
            ParseTree tree = parser.program();
            ASTBuilder astBuilder = new ASTBuilder(syntaxErrorHandler);
            ProgramNode ast = (ProgramNode) astBuilder.visit(tree);
            if (syntaxErrorHandler.isHaveError())
            {
                throw new RuntimeException();
            }
            //Semantic
            GlobalScope globalScope = (new ScopeInitializer(ast)).getGlobalScope();
            new ClassInitializer(globalScope).visit(ast);
            new FunctionInitializer(globalScope).visit(ast);
            new ClassMemberInitializer(globalScope).visit(ast);
            new ScopeBuilder(globalScope).visit(ast);
            new SemanticChecker(globalScope).visit(ast);

        } catch (Exception exception)
        {
            exception.printStackTrace();
            System.err.println(exception.getMessage());
            throw new RuntimeException();
        }
    }
}