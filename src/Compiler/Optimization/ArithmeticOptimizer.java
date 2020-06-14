package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.BinaryInst;
import Compiler.IR.IRInstruction.IRInstruction;
import Compiler.IR.IRInstruction.MoveInst;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.Immediate;
import Compiler.IR.Operand.Operand;

public class ArithmeticOptimizer extends Pass
{
    public ArithmeticOptimizer(IRRoot irRoot)
    {
        super(irRoot);
    }

    @Override
    public boolean run()
    {
        for (Function function : irRoot.getFunctionMap().values())
        {
            mulDivOptimize(function);
            addOptimize(function);
        }
        return false;
    }

    private void addOptimize(Function function)
    {
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            if (inst instanceof BinaryInst)
            {
                if (((BinaryInst) inst).getOp() == BinaryInst.Op.ADD)
                {
                    if (((BinaryInst) inst).getLhs() instanceof Immediate)
                    {
                        Operand tmp = ((BinaryInst) inst).getLhs();
                        ((BinaryInst) inst).setLhs(((BinaryInst) inst).getRhs());
                        ((BinaryInst) inst).setRhs(tmp);
                    }
                    if (((BinaryInst) inst).getRhs() instanceof Immediate)
                    {
                        int imm = ((Immediate) ((BinaryInst) inst).getRhs()).getImm();
                        if (imm == 0)
                        {
                            inst.replaceInst(new MoveInst(basicBlock, ((BinaryInst) inst).getLhs(), ((BinaryInst) inst).getDst()));
                        }
                    } else if (((BinaryInst) inst).getRhs() == ((BinaryInst) inst).getLhs())
                    {
                        inst.replaceInst(new BinaryInst(basicBlock, BinaryInst.Op.SHL,
                                ((BinaryInst) inst).getLhs(), new Immediate(1), ((BinaryInst) inst).getDst()));
                    }
                }
            }
        }
    }

    private void mulDivOptimize(Function function)
    {
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            if (inst instanceof BinaryInst)
            {
                if (((BinaryInst) inst).getOp() == BinaryInst.Op.MUL)
                {
                    if (((BinaryInst) inst).getLhs() instanceof Immediate)
                    {
                        Operand tmp = ((BinaryInst) inst).getLhs();
                        ((BinaryInst) inst).setLhs(((BinaryInst) inst).getRhs());
                        ((BinaryInst) inst).setRhs(tmp);
                    }
                    if (((BinaryInst) inst).getRhs() instanceof Immediate)
                    {
                        int imm = ((Immediate) ((BinaryInst) inst).getRhs()).getImm();
                        if ((imm & (imm-1)) == 0)
                        {
                            int shl = (int) Math.floor(Math.log(imm) / Math.log(2));
                            inst.replaceInst(new BinaryInst(basicBlock, BinaryInst.Op.SHL,
                                    ((BinaryInst) inst).getLhs(), new Immediate(shl), ((BinaryInst) inst).getDst()));
                        }
                    }
                } else if (((BinaryInst) inst).getOp() == BinaryInst.Op.DIV)
                {
                    if (((BinaryInst) inst).getRhs() instanceof Immediate)
                    {
                        int imm = ((Immediate) ((BinaryInst) inst).getRhs()).getImm();
                        if ((imm & (imm-1)) == 0 && imm > 0)
                        {
                            int shr = (int) Math.floor(Math.log(imm) / Math.log(2));
                            inst.replaceInst(new BinaryInst(basicBlock, BinaryInst.Op.SHR,
                                    ((BinaryInst) inst).getLhs(), new Immediate(shr), ((BinaryInst) inst).getDst()));
                        }
                    }
                }
            }
        }
    }
}
