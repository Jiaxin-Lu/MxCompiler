package Compiler.Type;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class LocalScope extends BaseScope
{
    public LocalScope(String name, Scope fatherScope)
    {
        super(name,fatherScope);
    }

    @Override
    public void defineClass(ClassSymbol obj)
    {

    }

    @Override
    public Symbol resolveSymbol(Position position, String id) throws SemanticError
    {
        Symbol type = symbolMap.get(id);
        if (type != null) return type;
        else return getFatherScope().resolveSymbol(position, id);
    }
}
