package Compiler.RISCV;


import Compiler.RISCV.RVInstruction.*;
import Compiler.RISCV.RVOperand.RVGlobalVariable;
import Compiler.RISCV.RVOperand.RVOperand;
import Compiler.RISCV.RVOperand.RVStaticStr;

public interface RVVisitor
{
    void visit(RVRoot rvRoot);
    void visit(RVFunction function);
    void visit(RVBasicBlock basicBlock);

    void visit(RVOperand operand);
    void visit(RVGlobalVariable rvGlobalVariable);
    void visit(RVStaticStr rvStaticStr);

    void visit(Call inst);
    void visit(CMPz inst);
    void visit(InstB inst);
    void visit(InstI inst);
    void visit(InstJ inst);
    void visit(InstJr inst);
    void visit(InstLa inst);
    void visit(InstLi inst);
    void visit(InstLui inst);
    void visit(InstR inst);
    void visit(Load inst);
    void visit(Store inst);
    void visit(Move inst);
}
