package Compiler.Utils;

import java.io.PrintStream;

public class SyntaxErrorHandler
{
    private PrintStream printStream;
    private boolean haveError;

    public SyntaxErrorHandler()
    {
        printStream = System.err;
        this.haveError = false;
    }

    public void syntaxError(String message)
    {
        haveError = true;
        printStream.println(message);
    }
    public void syntaxError(Position position, String message)
    {
        haveError = true;
        printStream.println(position.toString() + " " + message);
    }

    public boolean isHaveError()
    {
        return haveError;
    }
}
