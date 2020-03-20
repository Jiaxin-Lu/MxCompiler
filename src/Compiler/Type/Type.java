package Compiler.Type;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public interface Type
{
    String getTypeName();
    boolean isPrimitiveType();
    boolean isClassType();
    boolean isArrayType();
    boolean isNullType();
    boolean isPointerType();
    boolean isVariableType();
    boolean isFunctionType();
    void isCompatible(Position position, Type type) throws SemanticError;

    //IR
    int getTypeSize();
}
