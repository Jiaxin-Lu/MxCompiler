package Compiler;

import Compiler.AST.ProgramNode;
import Compiler.Backend.*;
import Compiler.Frontend.*;
import Compiler.IR.IRBuilder;
import Compiler.IR.IRPrinter;
import Compiler.IR.IRRoot;
import Compiler.IR.LLIRInterpreter.LLIRInterpreter;
import Compiler.Optimization.*;
import Compiler.Parser.MxErrorListener;
import Compiler.Parser.MxLexer;
import Compiler.Parser.MxParser;
import Compiler.RISCV.RVRoot;
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
//        InputStream inStream = new FileInputStream("code.txt");
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
//            UnusedEliminator unusedEliminator = new UnusedEliminator(globalScope);
//            while (unusedEliminator.isEliminated)
//                unusedEliminator.visit(ast);
            // should debug

            //ir gen

            IRBuilder irBuilder = new IRBuilder(globalScope);
            irBuilder.visit(ast);
            IRRoot irRoot = irBuilder.getIrRoot();
            System.out.println("Finish IRBuild.");

            FunctionInliner functionInliner = new FunctionInliner(irRoot);
            functionInliner.run();
            System.out.println("function inline complete!");

            GlobalVariableResolver globalVariableResolver = new GlobalVariableResolver(irRoot);
            globalVariableResolver.run();
            printIR(irRoot, "oldIrOutput.ir", false);

            optimize(irRoot);

            // codegen
            InstructionSelector instructionSelector = new InstructionSelector(irRoot);
            instructionSelector.run();
            RVRoot rvRoot = instructionSelector.getRvRoot();
            System.out.println("instruction selection complete!");

            //== only for debug ==
            new InstructionSelectorPrinter(rvRoot, new PrintStream("selectInst.s")).run();
            //== only for debug ==

            new SpillPriorityProcessor(rvRoot).run();
            System.out.println("spill priority process complete!");

            RegisterAllocator registerAllocator = new RegisterAllocator(rvRoot);
            registerAllocator.run();

            System.out.println("register allocation complete!");

            Peephole peephole = new Peephole(rvRoot);
            peephole.run();
            System.out.println("peephole optimize complete!");

            AsmPrinter asmPrinter = new AsmPrinter(rvRoot, new PrintStream("output.s"));
            asmPrinter.run();
        } catch (Exception exception)
        {
            exception.printStackTrace();
            System.err.println(exception.getMessage());
            throw new RuntimeException();
        }
    }

    private static void printIR(IRRoot irRoot, String fileName, boolean checkIR) throws IOException
    {
        PrintStream printStream = new PrintStream(fileName);
        IRPrinter irPrinter = new IRPrinter(printStream);
        irPrinter.visit(irRoot);

        if (checkIR)
        {
            InputStream irInterpreterIn = new FileInputStream(fileName);
            LLIRInterpreter llirInterpreter = new LLIRInterpreter(irInterpreterIn, false,
                    new DataInputStream(System.in), new PrintStream(System.out));
            llirInterpreter.run();
        }
    }

    private static void optimize(IRRoot irRoot) throws IOException
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
        System.out.println("Dominator Tree Construct complete!");
        ssaConstructor.run();
        System.out.println("SSA Construct complete!");
        boolean changed = true;
        int changedCnt = 0;
        while (changed)
        {
            changed = commonSubExpressionEliminator.run();
            System.out.println("CSE complete!");

            changed |= cfgSimplifier.run();
            System.out.println("Dead code Eliminator...");
            printIR(irRoot, "ssaIROutput.ir", false);
            dominatorTreeConstructor.run(true);
            System.out.println("Dead code Eliminator...");
            changed |= deadCodeEliminator.run();
            System.out.println("Dead code Eliminator complete!");

            changed |= sccp.run();
            System.out.println("SCCP complete!");

            changed |= cfgSimplifier.run();
            changed |= unusedFunctionEliminator.run();
            System.out.println("Unused Function Eliminator complete!");
//            ++ changedCnt;
//            if (changedCnt > 10) break;
        }
        ssaDestructor.run();

        cfgSimplifier.run(true);
        printIR(irRoot, "irOutput.ir", true);
    }
}