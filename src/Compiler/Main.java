package Compiler;

import Compiler.AST.ProgramNode;
import Compiler.Frontend.*;
import Compiler.IR.IRBuilder;
import Compiler.IR.IRPrinter;
import Compiler.IR.IRRoot;
import Compiler.IR.LLIRInterpreter.LLIRInterpreter;
import Compiler.Optimization.*;
import Compiler.Parser.MxErrorListener;
import Compiler.Parser.MxLexer;
import Compiler.Parser.MxParser;
import Compiler.Type.GlobalScope;
import Compiler.Utils.*;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.*;

public class Main
{
    public static void main(String[] args) throws Exception
    {
        SyntaxErrorHandler syntaxErrorHandler = new SyntaxErrorHandler();
        InputStream inStream = new FileInputStream("code.mx");
//        InputStream inStream = System.in;
        try
        {
            //Syntax
            MxLexer lexer = new MxLexer(CharStreams.fromStream(inStream));
            lexer.removeErrorListeners();
            lexer.addErrorListener(new MxErrorListener(syntaxErrorHandler));

            MxParser parser = new MxParser(new CommonTokenStream(lexer));
            parser.removeErrorListeners();
            parser.addErrorListener(new MxErrorListener(syntaxErrorHandler));
            ParseTree tree = parser.program();
            if (syntaxErrorHandler.isHaveError())
            {
                throw new RuntimeException();
            }

            ASTBuilder astBuilder = new ASTBuilder(syntaxErrorHandler);
            ProgramNode ast = (ProgramNode) astBuilder.visit(tree);
            if (syntaxErrorHandler.isHaveError())
            {
                throw new RuntimeException();
            }
            //Semantic
            GlobalScope globalScope = (new ScopeInitializer(ast)).getGlobalScope();
            GlobalDeclScanner globalDeclScanner = new GlobalDeclScanner(globalScope);
            globalDeclScanner.visit(ast);
            ClassMemberInitializer classMemberInitializer = new ClassMemberInitializer(globalScope);
            classMemberInitializer.visit(ast);
            ScopeBuilder scopeBuilder = new ScopeBuilder(globalScope);
            scopeBuilder.visit(ast);
            SemanticChecker semanticChecker = new SemanticChecker(globalScope);
            semanticChecker.visit(ast);
            System.out.println("Success");

            // a little optimizer
            UnusedEliminator unusedEliminator = new UnusedEliminator(globalScope);
            while (unusedEliminator.isEliminated)
                unusedEliminator.visit(ast);

            IRBuilder irBuilder = new IRBuilder(globalScope);
            irBuilder.visit(ast);
            IRRoot irRoot = irBuilder.getIrRoot();

            PrintStream printStream = new PrintStream("irOutput.ir");
            IRPrinter irPrinter = new IRPrinter(printStream);
            irPrinter.visit(irRoot);

            InputStream irInterpreterIn = new FileInputStream("irOutput.ir");
            LLIRInterpreter llirInterpreter = new LLIRInterpreter(irInterpreterIn, false,
                    new DataInputStream(System.in), new PrintStream(System.out));
            llirInterpreter.run();

            GlobalVariableResolver globalVariableResolver = new GlobalVariableResolver(irRoot);
            globalVariableResolver.run();

            optimize(irRoot);

        } catch (Exception exception)
        {
            exception.printStackTrace();
            System.err.println(exception.getMessage());
            throw new RuntimeException();
        }
    }

    private static void optimize(IRRoot irRoot)
    {
        CFGSimplifier cfgSimplifier = new CFGSimplifier(irRoot);
        DominatorTreeConstructor dominatorTreeConstructor = new DominatorTreeConstructor(irRoot);
        SSAConstructor ssaConstructor = new SSAConstructor(irRoot);
        UnusedFunctionEliminator unusedFunctionEliminator = new UnusedFunctionEliminator(irRoot);
        CSE commonSubExpressionEliminator = new CSE(irRoot);
        DeadCodeEliminator deadCodeEliminator = new DeadCodeEliminator(irRoot);
        SCCP sccp = new SCCP(irRoot);
        SSADestructor ssaDestructor = new SSADestructor(irRoot);

        cfgSimplifier.run();
        dominatorTreeConstructor.run();
        ssaConstructor.run();
        boolean changed = true;
        while (changed)
        {
            changed = commonSubExpressionEliminator.run();
            changed |= sccp.run();
            changed |= cfgSimplifier.run();
            dominatorTreeConstructor.run(true);
            changed |= deadCodeEliminator.run();
            changed |= cfgSimplifier.run();
            changed |= unusedFunctionEliminator.run();
        }
        ssaDestructor.run();
        cfgSimplifier.run();
    }
}