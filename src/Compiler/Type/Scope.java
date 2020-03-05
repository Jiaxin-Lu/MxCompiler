package Compiler.Type;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public interface Scope
{
    String getScopeName();
    Scope getFatherScope();
    void defineClass(ClassSymbol obj) throws SemanticError;
    void defineFunction(FunctionSymbol obj) throws  SemanticError;
    void defineVariable(VariableSymbol obj) throws SemanticError;
    Symbol resolveSymbol(Position position, String id) throws SemanticError;
}
