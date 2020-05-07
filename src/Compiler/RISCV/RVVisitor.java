package Compiler.RISCV;


import Compiler.RISCV.RVInstruction.*;
import Compiler.RISCV.RVOperand.GlobalVariable;
import Compiler.RISCV.RVOperand.RVOperand;
import Compiler.RISCV.RVOperand.StaticStr;

public interface RVVisitor
{
    void visit(RVRoot rvRoot);
    void visit(RVFunction function);
    void visit(RVBasicBlock basicBlock);

    void visit(RVOperand operand);
    void visit(GlobalVariable globalVariable);
    void visit(StaticStr staticStr);

    void visit(Call inst);
    void visit(CMPz inst);
    void visit(Branch inst);
    void visit(InstI inst);
    void visit(InstJ inst);
    void visit(InstJr inst);
    void visit(InstLi inst);
    void visit(InstLui inst);
    void visit(InstR inst);
    void visit(Load inst);
    void visit(Store inst);
    void visit(Move inst);
}
