package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public abstract class PrimitiveTypeNode extends TypeNode {
    public PrimitiveTypeNode(Position position, String typeId)
    {
        super(position, typeId);
    }
}
