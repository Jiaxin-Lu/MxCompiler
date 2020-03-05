package Compiler.Utils;

import org.antlr.v4.runtime.Token;

public class Position
{
    public int line, column;
    public Position(Token token)
    {
        this.line = token.getLine();
        this.column = token.getCharPositionInLine();
    }
    public Position(int line, int column)
    {
        this.line = line;
        this.column = column;
    }

    public int getLine()
    {
        return line;
    }

    public int getColumn()
    {
        return column;
    }
    public String toString()
    {
        String str = "line " + line + " : column " + column;
        return str;
    }
}