package Compiler.Backend;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVFunction;
import Compiler.RISCV.RVInstruction.*;
import Compiler.RISCV.RVOperand.GlobalVariable;
import Compiler.RISCV.RVOperand.RVOperand;
import Compiler.RISCV.RVOperand.StaticStr;
import Compiler.RISCV.RVRoot;
import Compiler.RISCV.RVVisitor;

import java.io.PrintStream;

public class AsmPrinter implements RVVisitor
{
    private PrintStream output;
    private RVRoot rvRoot;

    public AsmPrinter(RVRoot rvRoot, PrintStream output)
    {
        this.rvRoot = rvRoot;
        this.output = output;
    }

    @Override
    public void visit(RVRoot rvRoot)
    {

    }

    @Override
    public void visit(RVFunction function)
    {

    }

    @Override
    public void visit(RVBasicBlock basicBlock)
    {

    }

    @Override
    public void visit(RVOperand operand)
    {

    }

    @Override
    public void visit(GlobalVariable globalVariable)
    {

    }

    @Override
    public void visit(StaticStr staticStr)
    {

    }

    @Override
    public void visit(Call inst)
    {

    }

    @Override
    public void visit(CMPz inst)
    {

    }

    @Override
    public void visit(Branch inst)
    {

    }

    @Override
    public void visit(InstI inst)
    {

    }

    @Override
    public void visit(InstJ inst)
    {

    }

    @Override
    public void visit(InstJr inst)
    {

    }

    @Override
    public void visit(InstLi inst)
    {

    }

    @Override
    public void visit(InstLui inst)
    {

    }

    @Override
    public void visit(InstR inst)
    {

    }

    @Override
    public void visit(Load inst)
    {

    }

    @Override
    public void visit(Store inst)
    {

    }

    @Override
    public void visit(Move inst)
    {

    }
}
