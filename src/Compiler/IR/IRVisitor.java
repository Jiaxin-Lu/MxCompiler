package Compiler.IR;

import Compiler.IR.IRInstruction.*;
import Compiler.IR.Operand.Immediate;
import Compiler.IR.Operand.Register;

public interface IRVisitor
{
    void visit(IRRoot irRoot);
    void visit(Function function);
    void visit(BasicBlock basicBlock);
    void visit(Alloc inst);
    void visit(Branch inst);
    void visit(Binary inst);
    void visit(Unary inst);
    void visit(Call inst);
    void visit(Move inst);
    void visit(Load inst);
    void visit(Store inst);
    void visit(Cmp inst);
    void visit(Phi inst);
    void visit(Push inst);
    void visit(Pop inst);
    void visit(Jump inst);
    void visit(Return inst);
    void visit(Register register);
    void visit(Immediate immediate);
}
