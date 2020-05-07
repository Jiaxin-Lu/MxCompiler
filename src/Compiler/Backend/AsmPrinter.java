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
import java.util.List;

public class AsmPrinter implements RVVisitor
{
    private PrintStream output;
    private RVRoot rvRoot;
    private static final String indent = "\t";

    public AsmPrinter(RVRoot rvRoot, PrintStream output)
    {
        this.rvRoot = rvRoot;
        this.output = output;
    }

    public void run()
    {
        rvRoot.accept(this);
    }

    @Override
    public void visit(RVRoot rvRoot)
    {
        List<GlobalVariable> globalVariables = rvRoot.getGlobalVariableList();
        List<StaticStr> staticStr = rvRoot.getStaticStrList();

        if (!globalVariables.isEmpty() || !staticStr.isEmpty())
        {
            //print global variable and strings
            output.println(indent + ".data\n");
            for (StaticStr str : staticStr)
            {
                str.accept(this);
            }
            for (GlobalVariable globalVariable : globalVariables)
            {
                globalVariable.accept(this);
            }
            output.println();
        }

        output.println(indent + ".text\n");
        for (RVFunction function : rvRoot.getFunctionMap().values())
        {
            function.accept(this);
        }
    }

    @Override
    public void visit(RVFunction function)
    {
        output.println(indent + ".globl\t" + function.getName());
        output.println(indent + ".p2align\t2");
        output.println(indent + ".type\t" + function.getName() + ", @function");
        output.println(function.getName() + ":");
        for (RVBasicBlock basicBlock : function.getPreOrderBlockList())
        {
            basicBlock.accept(this);
        }
        output.println();
    }

    @Override
    public void visit(RVBasicBlock basicBlock)
    {
        if (!basicBlock.getName().contains("entry"))
            output.println(basicBlock.getName() + ":");
        for (RVInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            inst.accept(this);
        output.println();
    }

    @Override
    public void visit(RVOperand operand)
    {
        assert false;
    }

    @Override
    public void visit(GlobalVariable globalVariable)
    {
        output.println(indent + ".globl\t" + globalVariable);
        output.println(indent + ".p2align\t2");
        output.println(globalVariable + ":");
        if (globalVariable.getValue() != null)
            output.println(indent + ".word\t" + globalVariable.getValue());
        else output.println(indent + ".word\t0");
        output.println();
    }

    @Override
    public void visit(StaticStr staticStr)
    {
        output.println(indent + ".globl\t" + staticStr);
        output.println(staticStr + ":");
        output.println(indent + ".asciz\t" + staticStr.getString());
        output.println();
    }

    @Override
    public void visit(Call inst)
    {
        output.println(inst);
    }

    @Override
    public void visit(CMPz inst)
    {
        output.println(inst);
    }

    @Override
    public void visit(Branch inst)
    {
        output.println(inst);
    }

    @Override
    public void visit(InstI inst)
    {
        output.println(inst);
    }

    @Override
    public void visit(InstJ inst)
    {
        output.println(inst);
    }

    @Override
    public void visit(InstJr inst)
    {
        output.println(inst);
    }

    @Override
    public void visit(InstLi inst)
    {
        output.println(inst);
    }

    @Override
    public void visit(InstLui inst)
    {
        output.println(inst);
    }

    @Override
    public void visit(InstR inst)
    {
        output.println(inst);
    }

    @Override
    public void visit(Load inst)
    {
        output.println(inst);
    }

    @Override
    public void visit(Store inst)
    {
        output.println(inst);
    }

    @Override
    public void visit(Move inst)
    {
        output.println(inst);
    }
}
