package Compiler.Backend;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVFunction;
import Compiler.RISCV.RVInstruction.*;
import Compiler.RISCV.RVOperand.RVGlobalVariable;
import Compiler.RISCV.RVOperand.RVOperand;
import Compiler.RISCV.RVOperand.RVStaticStr;
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
        List<RVGlobalVariable> RVGlobalVariables = rvRoot.getGlobalVariableList();
        List<RVStaticStr> RVStaticStr = rvRoot.getStaticStrList();

        if (!RVGlobalVariables.isEmpty() || !RVStaticStr.isEmpty())
        {
            //print global variable and strings
            output.println(indent + ".data\n");
            for (RVStaticStr str : RVStaticStr)
            {
                str.accept(this);
            }
            for (RVGlobalVariable RVGlobalVariable : RVGlobalVariables)
            {
                RVGlobalVariable.accept(this);
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
    public void visit(RVGlobalVariable rvGlobalVariable)
    {
        output.println(indent + ".globl\t" + rvGlobalVariable);
        output.println(rvGlobalVariable + ":");
        output.println(".zero\t4");
//        output.println(indent + ".p2align\t2");
//        output.println(RVGlobalVariable + ":");
//        if (RVGlobalVariable.getValue() != null)
//            output.println(indent + ".word\t" + RVGlobalVariable.getValue());
//        else output.println(indent + ".word\t0");
        output.println();
    }

    @Override
    public void visit(RVStaticStr rvStaticStr)
    {
        output.println(indent + ".globl\t" + rvStaticStr);
        output.println(rvStaticStr + ":");
        output.println(indent + ".string\t" + rvStaticStr.getString());
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
    public void visit(InstB inst)
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
    public void visit(InstLa inst)
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
