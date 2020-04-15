package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.*;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.Immediate;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.*;

//Sparse Conditional Constant Propagation
public class SCCP extends Pass
{
    boolean isChanged = false;

    static class OperandStatus
    {
        public enum Status
        {
            UNDEFINED, CONSTANT, MULTIDEFINED
        }
        public Status status = Status.UNDEFINED;
        public Operand operand;

        public OperandStatus(Operand operand, Status status)
        {
            this.operand = operand;
            this.status = status;
        }
    }

    private Queue<BasicBlock> CFGList = new LinkedList<>();
    private Queue<Register> SSAList = new LinkedList<>();
    private Set<BasicBlock> unExecutedBlock = new HashSet<>();
    private Map<Operand, OperandStatus> valueLattice = new HashMap<>();

    public SCCP(IRRoot irRoot)
    {
        super(irRoot);
    }
    @Override
    public boolean run()
    {
        isChanged = false;
        for (Function function : irRoot.getFunctionMap().values())
        {
            resolveDefUseChain(function);
            sparseConditionalConstantPropagation(function);
            resolveDefUseChain(function);
        }
        return isChanged;
    }

    private void markUnExecuted(BasicBlock basicBlock)
    {
        if (!unExecutedBlock.contains(basicBlock))
        {
            unExecutedBlock.add(basicBlock);
            CFGList.offer(basicBlock);
        } else
        {
            for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            if (inst instanceof Phi)
            {
                evaluate((Phi) inst);
            } else break;
        }
    }

    void sparseConditionalConstantPropagation(Function function)
    {
        CFGList.clear();
        SSAList.clear();
        unExecutedBlock.clear();
        valueLattice.clear();
        markUnExecuted(function.getEntryBlock());
        while (!CFGList.isEmpty() || !SSAList.isEmpty())
        {
            while (!CFGList.isEmpty())
            {
                BasicBlock block = CFGList.poll();
                for (IRInstruction inst = block.headInst; inst != null; inst = inst.getNextInst())
                {
                    evaluateInst(inst);
                }
            }
            while (!SSAList.isEmpty())
            {
                Register reg = SSAList.poll();
                for (IRInstruction inst : used.get(reg))
                {
                    evaluateInst(inst);
                }
            }
        }

        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            replaceRegisterWithImmediate(basicBlock);
        }
    }

    private void replaceRegisterWithImmediate(BasicBlock basicBlock)
    {
        for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
        {
            OperandStatus operandStatus = getStatus(inst.getOriginRegister());
            if (operandStatus.status == OperandStatus.Status.CONSTANT)
            {
                inst.replaceInst(new Move(basicBlock, operandStatus.operand, inst.getOriginRegister()));
                isChanged = true;
            }
        }
    }

    void evaluateInst(IRInstruction inst)
    {
        if (inst instanceof Binary)
        {
            evaluate((Binary) inst);
        } else if (inst instanceof Cmp)
        {
            evaluate((Cmp) inst);
        } else if (inst instanceof Unary)
        {
            evaluate((Unary) inst);
        } else if (inst instanceof Load)
        {
            evaluate((Load) inst);
        } else if (inst instanceof Alloc)
        {
            evaluate((Alloc) inst);
        } else if (inst instanceof Call)
        {
            evaluate((Call) inst);
        } else if (inst instanceof Branch)
        {
            evaluate((Branch) inst);
        } else if (inst instanceof Phi)
        {
            evaluate((Phi) inst);
        }
    }
    void evaluate(Binary inst)
    {
        Operand lhs = inst.getLhs();
        OperandStatus lhsStatus = getStatus(lhs);
        Operand rhs = inst.getRhs();
        OperandStatus rhsStatus = getStatus(rhs);
        if (lhsStatus.status == OperandStatus.Status.CONSTANT && rhsStatus.status == OperandStatus.Status.CONSTANT)
        {
            Immediate resultImm = foldConstant(inst , (Immediate)lhsStatus.operand, (Immediate)rhsStatus.operand);
            if (resultImm != null)
            {
                markConstant(inst.getOriginRegister(), resultImm);
            }
        } else if (lhsStatus.status == OperandStatus.Status.MULTIDEFINED || rhsStatus.status == OperandStatus.Status.MULTIDEFINED)
        {
            markMultiDefined(inst.getOriginRegister());
        }
    }
    void evaluate(Cmp inst)
    {
        Operand lhs = inst.getLhs();
        Operand rhs = inst.getRhs();
        OperandStatus lhsStatus = getStatus(lhs);
        OperandStatus rhsStatus = getStatus(rhs);
        if (lhsStatus.status == OperandStatus.Status.CONSTANT && rhsStatus.status == OperandStatus.Status.CONSTANT)
        {
            Immediate resultImm = foldConstant(inst , (Immediate)lhsStatus.operand, (Immediate)rhsStatus.operand);
            if (resultImm != null)
                markConstant(inst.getOriginRegister(), resultImm);
        } else if (lhsStatus.status == OperandStatus.Status.MULTIDEFINED || rhsStatus.status == OperandStatus.Status.MULTIDEFINED)
        {
            markMultiDefined(inst.getOriginRegister());
        }
    }
    void evaluate(Unary inst)
    {
        Operand src = inst.getSrc();
        OperandStatus srcStatus = getStatus(src);
        if (srcStatus.status == OperandStatus.Status.CONSTANT)
        {
            Immediate resultImm = foldConstant(inst, (Immediate)srcStatus.operand, null);
            if (resultImm != null)
            {
                markConstant(inst.getOriginRegister(), resultImm);
            }
        } else if (srcStatus.status == OperandStatus.Status.MULTIDEFINED)
        {
            markMultiDefined(inst.getOriginRegister());
        }
    }
    void evaluate(Load inst)
    {
        markMultiDefined(inst.getOriginRegister());
    }
    void evaluate(Alloc inst)
    {
        markMultiDefined(inst.getOriginRegister());
    }
    void evaluate(Call inst)
    {
        //TODO : Consider builtin function
        if (inst.getOriginRegister() != null)
            markMultiDefined(inst.getOriginRegister());
    }
    void evaluate(Branch inst)
    {
        if (inst.getCond() == null)
            markUnExecuted(inst.getThenBlock());
        else
        {
            OperandStatus condStatus = getStatus(inst.getCond());
            if (condStatus.status == OperandStatus.Status.CONSTANT)
            {
                if (((Immediate)condStatus.operand).getImm() == 1)
                {
                    markUnExecuted(inst.getThenBlock());
                } else
                {
                    markUnExecuted(inst.getElseBlock());
                }
            } else if (condStatus.status == OperandStatus.Status.MULTIDEFINED)
            {
                markUnExecuted(inst.getThenBlock());
                markUnExecuted(inst.getElseBlock());
            }
        }
    }
    void evaluate(Phi inst)
    {
        Immediate constImm = null;
        for (Map.Entry<BasicBlock, Operand> path : inst.getPath().entrySet())
        {
            BasicBlock basicBlock = path.getKey();
            if (!unExecutedBlock.contains(basicBlock))
                continue;
            Operand operand = path.getValue();
            OperandStatus status = getStatus(operand);
            if (status.status == OperandStatus.Status.MULTIDEFINED)
            {
                markMultiDefined(inst.getOriginRegister());
                return;
            } else if (status.status == OperandStatus.Status.CONSTANT)
            {
                if (constImm != null)
                {
                    if (constImm.getImm() != ((Immediate)status.operand).getImm())
                    {
                        markMultiDefined(inst.getOriginRegister());
                        return;
                    }
                } else {
                    constImm = (Immediate) status.operand;
                }
            }
        }
        if (constImm != null)
            markConstant(inst.getOriginRegister(), constImm);
    }
    OperandStatus getStatus(Operand operand)
    {
        if (valueLattice.containsKey(operand))
            return valueLattice.get(operand);
        OperandStatus status;
        if (operand instanceof Immediate)
            status = new OperandStatus(operand, OperandStatus.Status.CONSTANT);
        else if (((VirtualRegister)operand).isParameter)
            status = new OperandStatus(operand, OperandStatus.Status.MULTIDEFINED);
        else status = new OperandStatus(operand, OperandStatus.Status.UNDEFINED);
        valueLattice.put(operand, status);
        return status;
    }
    void markMultiDefined(Operand operand)
    {
        if (operand == null) return;
        if (getStatus(operand).status != OperandStatus.Status.MULTIDEFINED)
        {
            valueLattice.replace(operand, new OperandStatus(operand, OperandStatus.Status.MULTIDEFINED));
            SSAList.offer((Register) operand);
        }
    }

    private Immediate foldConstant(IRInstruction inst, Immediate lhs, Immediate rhs)
    {
        if (inst instanceof Binary)
        {
            int result;
            switch (((Binary) inst).getOp())
            {
                case MUL:
                    result = lhs.getImm() * rhs.getImm();
                    break;
                case DIV:
                    if (rhs.getImm() == 0)
                        return null;
                    result = lhs.getImm() / rhs.getImm();
                    break;
                case MOD:
                    if (rhs.getImm() == 0)
                        return null;
                    result = lhs.getImm() % rhs.getImm();
                    break;
                case ADD:
                    result = lhs.getImm() + rhs.getImm();
                    break;
                case SUB:
                    result = lhs.getImm() - rhs.getImm();
                    break;
                case SHL:
                    result = lhs.getImm() << rhs.getImm();
                    break;
                case SHR:
                    result = lhs.getImm() >> rhs.getImm();
                    break;
                case AND:
                    result = lhs.getImm() & rhs.getImm();
                    break;
                case XOR:
                    result = lhs.getImm() ^ rhs.getImm();
                    break;
                case OR:
                    result = lhs.getImm() | rhs.getImm();
                    break;
                default:
                    return null;
            }
            return new Immediate(result);
        } else if (inst instanceof Unary)
        {
            int result;
            switch (((Unary) inst).getOp())
            {
                case NOT:
                    result = ~lhs.getImm();
                    break;
                case NEG:
                    result = -lhs.getImm();
                    break;
                default:
                    return null;
            }
            return new Immediate(result);
        } else if (inst instanceof Cmp)
        {
            int result;
            switch (((Cmp) inst).getOp())
            {
                case LT:
                    result = lhs.getImm() < rhs.getImm() ? 1 : 0;
                    break;
                case LEQ:
                    result = lhs.getImm() <= rhs.getImm() ? 1 : 0;
                    break;
                case REQ:
                    result = lhs.getImm() >= rhs.getImm() ? 1 : 0;
                    break;
                case RT:
                    result = lhs.getImm() > rhs.getImm() ? 1 : 0;
                    break;
                case EQ:
                    result = lhs.getImm() == rhs.getImm() ? 1 : 0;
                    break;
                case NEQ:
                    result = lhs.getImm() != rhs.getImm() ? 1 : 0;
                    break;
                default:
                    return null;
            }
            return new Immediate(result);
        }
        return null;
    }

    private void markConstant(Register register, Immediate immediate)
    {
        OperandStatus status = new OperandStatus(immediate, OperandStatus.Status.CONSTANT);
        OperandStatus oldStatus = getStatus(register);
        if (oldStatus.status == OperandStatus.Status.UNDEFINED)
        {
            valueLattice.replace(register, status);
            SSAList.offer(register);
        }
    }

    //TODO : handle the new Move

}
