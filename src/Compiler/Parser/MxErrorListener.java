package Compiler.Parser;

import Compiler.Utils.SyntaxError;
import Compiler.Utils.Position;
import Compiler.Utils.SyntaxErrorHandler;
import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;

public class MxErrorListener extends BaseErrorListener
{
    private SyntaxErrorHandler syntaxErrorHandler;
    public MxErrorListener(SyntaxErrorHandler syntaxErrorHandler)
    {
        this.syntaxErrorHandler = syntaxErrorHandler;
    }
    @Override
    public void syntaxError(Recognizer<?, ?> recognizer,
                            Object offendingSymbol, int line, int charPositionInLine,
                            String msg, RecognitionException e)
    {
        syntaxErrorHandler.syntaxError(new Position(line, charPositionInLine), msg);
        //throw new SyntaxError(new Position(line, charPositionInLine), msg);
    }
}
