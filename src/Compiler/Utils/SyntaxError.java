package Compiler.Utils;

public class SyntaxError extends Exception
{
    private Position position;
    public SyntaxError()
    {
        this.position = null;
    }
    public SyntaxError(Position position, String message)
    {
        super(message);
        this.position = position;
    }

    @Override
    public String getMessage()
    {
        return "Syntax Error: " + position.toString() + " " + super.getMessage();
    }
}
