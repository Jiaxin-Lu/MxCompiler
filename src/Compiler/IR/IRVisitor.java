package Compiler.IR;

import Compiler.IR.IRInstruction.*;
import Compiler.IR.Operand.*;

public interface IRVisitor
{
    void visit(IRRoot irRoot);
    void visit(Function function);
    void visit(BasicBlock basicBlock);
    void visit(AllocInst inst);
    void visit(BranchInst inst);
    void visit(BinaryInst inst);
    void visit(UnaryInst inst);
    void visit(CallInst inst);
    void visit(MoveInst inst);
    void visit(LoadInst inst);
    void visit(StoreInst inst);
    void visit(CmpInst inst);
    void visit(Phi inst);
    void visit(JumpInst inst);
    void visit(ReturnInst inst);
    void visit(Register register);
    void visit(Immediate immediate);
    void visit(Memory memory);
    // TODO: CHECK THIS AFTER FINISHING THE IR INSTRUCTION PACKAGE!
}
