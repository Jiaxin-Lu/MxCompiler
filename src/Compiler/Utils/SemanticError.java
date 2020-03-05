package Compiler.Utils;

public class SemanticError extends Exception
{
    private Position position;
    public SemanticError()
    {
        this.position = null;
    }
    public SemanticError(Position position, String message)
    {
        super(message);
        this.position = position;
    }

    @Override
    public String getMessage()
    {
        return "Semantic Error: " + position.toString() + " " + super.getMessage();
    }
}
