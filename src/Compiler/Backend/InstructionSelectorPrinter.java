package Compiler.Backend;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVFunction;
import Compiler.RISCV.RVInstruction.*;
import Compiler.RISCV.RVOperand.*;
import Compiler.RISCV.RVRoot;
import Compiler.RISCV.RVVisitor;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class InstructionSelectorPrinter implements RVVisitor
{
    private RVRoot rvRoot;
    private PrintStream output;

    private static final String indent = "\t";

    public InstructionSelectorPrinter(RVRoot rvRoot, PrintStream output)
    {
        this.rvRoot = rvRoot;
        this.output = output;
    }

    public void run()
    {
        visit(rvRoot);
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
        //        output.println(indent + ".p2align\t2");
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
        if (operand instanceof RVImmediate)
        {
            output.print(((RVImmediate) operand).getImm());
        } else if (operand instanceof RVRegister)
        {
            output.print(operand.getName());
        } else if (operand instanceof StackData)
        {
            output.print(((StackData) operand).getIndex() + "(sp)");
        }
    }

    @Override
    public void visit(RVGlobalVariable rvGlobalVariable)
    {
        output.println(indent + ".globl\t" + rvGlobalVariable);
        output.println(rvGlobalVariable + ":");
        output.println(indent + ".zero\t4");
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
        output.println(indent + "call" + indent + inst.getFunction().getName());
    }

    @Override
    public void visit(CMPz inst)
    {
        output.print(indent + inst.getOp() +indent);
        inst.getRd().accept(this);
        output.print(",");
        inst.getRs().accept(this);
        output.println();
    }

    @Override
    public void visit(InstB inst)
    {
        output.print(indent + inst.getOp() + indent + indent);
        inst.getRs().accept(this);
        output.print(",");
        inst.getRt().accept(this);
        output.println("," + inst.getDst().getName());
    }

    @Override
    public void visit(InstI inst)
    {
        output.print(indent + inst.getOp() + indent);
        inst.getRd().accept(this);
        output.print(",");
        inst.getRs().accept(this);
        output.println("," + inst.getImm().getImm());
    }

    @Override
    public void visit(InstJ inst)
    {
        output.println(indent + "j" + indent + indent + inst.getDst().getName());
    }

    @Override
    public void visit(InstJr inst)
    {
        output.print(indent + "jr" + indent + indent);
        inst.getRs().accept(this);
        output.println();
    }

    @Override
    public void visit(InstLa inst)
    {
        output.print(indent + "la" + indent + indent);
        inst.getRd().accept(this);
        output.println("," + inst.getStr().getName());
    }

    @Override
    public void visit(InstLi inst)
    {
        output.print(indent + "li" + indent + indent);
        inst.getRd().accept(this);
        output.println("," + inst.getImm().getImm());
    }

    @Override
    public void visit(InstLui inst)
    {
        output.print(indent + "lui" + indent + indent);
        inst.getRd().accept(this);
        output.println("," + inst.getImm().getImm());
    }

    @Override
    public void visit(InstR inst)
    {
        if (inst.getOp() == InstR.Op.sltu)
        {
            output.print(indent + inst.getOp() + indent);
        } else {
            output.print(indent + inst.getOp() + indent + indent);
        }
        inst.getRd().accept(this);
        output.print(",");
        inst.getRs1().accept(this);
        output.print(",");
        inst.getRs2().accept(this);
        output.println();
    }

    @Override
    public void visit(Load inst)
    {
        if (inst.getSrc() instanceof StackData)
        {
            output.print(indent + "lw" + indent + indent);
            inst.getRd().accept(this);
            output.print(",");
            inst.getSrc().accept(this);
            output.println();
        } else {
            output.print(indent + "lw" + indent + indent);
            inst.getRd().accept(this);
            output.print("," + inst.getImm().getImm() + "(");
            inst.getSrc().accept(this);
            output.println(")");
        }
    }

    @Override
    public void visit(Store inst)
    {
        if (inst.getDst() instanceof StackData)
        {
            output.print(indent + "sw" + indent + indent);
            inst.getRd().accept(this);
            output.print(",");
            inst.getDst().accept(this);
            output.println();
        } else {
            output.print(indent + "sw" + indent + indent);
            inst.getRd().accept(this);
            output.print("," + inst.getImm().getImm() + "(");
            inst.getDst().accept(this);
            output.println(")");
        }
    }

    @Override
    public void visit(Move inst)
    {
        output.print(indent + "mv" + indent + indent);
        inst.getRd().accept(this);
        output.print(",");
        inst.getRs().accept(this);
        output.println();
    }
}
