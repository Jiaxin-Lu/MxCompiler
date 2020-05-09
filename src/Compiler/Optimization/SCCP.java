package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.*;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.*;

import java.util.*;

//Sparse Conditional Constant Propagation
public class SCCP extends Pass
{
    boolean isChanged = false;

    static class OperandStatus
    {
        public enum Status
        {
            UNDEFINED, CONSTANT, CONSTANTSTR, MULTIDEFINED
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
            sparseConditionalConstantPropagation(function);
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
        resolveDefUseChain(function);
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
            replaceRegisterWithConstant(basicBlock);
        }
        resolveDefUseChain(function);
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            handleNewMove(basicBlock);
        }
    }

    private void replaceRegisterWithConstant(BasicBlock basicBlock)
    {
        for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
        {
            OperandStatus operandStatus = getStatus(inst.getDefRegister());
            if (operandStatus.status == OperandStatus.Status.CONSTANT)
            {
                inst.replaceInst(new MoveInst(basicBlock, operandStatus.operand, inst.getDefRegister()));
                isChanged = true;
            } else if (operandStatus.status == OperandStatus.Status.CONSTANTSTR)
            {
                inst.replaceInst(new MoveInst(basicBlock, operandStatus.operand, inst.getDefRegister()));
                isChanged = true;
            }
        }
    }

    //DONE : handle the new Move
    private void handleNewMove(BasicBlock basicBlock)
    {
        for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
        {
            if (inst instanceof MoveInst)
            {
                Operand src = ((MoveInst) inst).getSrc();
                Register dst = (Register) ((MoveInst) inst).getDst();
                if (src instanceof Immediate)
                {
                    boolean hasPhi = false;
                    Set<IRInstruction> oldUsed = new HashSet<>(used.get((dst)));
                    for (IRInstruction oldUse : oldUsed)
                    {
                        if (oldUse != inst)
                        {
                            if (!(oldUse instanceof Phi))
                            {
                                isChanged = true;
                                used.get(dst).remove(oldUse);
                                oldUse.replaceUsedRegister(dst, src);
                            } else hasPhi = true;
                        }
                    }
                    if (!hasPhi) inst.removeThis();
                } else if (src instanceof VirtualRegister)
                {
                    boolean hasPhi = false;
                    Set<IRInstruction> oldUsed = new HashSet<>(used.get(dst));
                    Set<IRInstruction> newUsed = used.get(src);
                    for (IRInstruction oldUse : oldUsed)
                    {
                        if (oldUse != inst)
                        {
                            if (!(oldUse instanceof Phi))
                            {
                                isChanged = true;
                                used.get(dst).remove(oldUse);
                                oldUse.replaceUsedRegister(dst, src);
                                newUsed.add(oldUse);
                            } else hasPhi = true;
                        }
                    }
                    if (!hasPhi)
                    {
                        newUsed.remove(inst);
                        inst.removeThis();
                    }
                }
            }
        }
    }

    void evaluateInst(IRInstruction inst)
    {
        if (inst instanceof BinaryInst)
        {
            evaluate((BinaryInst) inst);
        } else if (inst instanceof CmpInst)
        {
            evaluate((CmpInst) inst);
        } else if (inst instanceof UnaryInst)
        {
            evaluate((UnaryInst) inst);
        } else if (inst instanceof LoadInst)
        {
            evaluate((LoadInst) inst);
        } else if (inst instanceof AllocInst)
        {
            evaluate((AllocInst) inst);
        } else if (inst instanceof CallInst)
        {
            evaluate((CallInst) inst);
        } else if (inst instanceof BranchInst)
        {
            evaluate((BranchInst) inst);
        } else if (inst instanceof Phi)
        {
            evaluate((Phi) inst);
        }
    }
    void evaluate(BinaryInst inst)
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
                markConstant(inst.getDefRegister(), resultImm);
            }
        } else if (lhsStatus.status == OperandStatus.Status.MULTIDEFINED || rhsStatus.status == OperandStatus.Status.MULTIDEFINED)
        {
            markMultiDefined(inst.getDefRegister());
        }
    }
    void evaluate(CmpInst inst)
    {
        Operand lhs = inst.getLhs();
        Operand rhs = inst.getRhs();
        OperandStatus lhsStatus = getStatus(lhs);
        OperandStatus rhsStatus = getStatus(rhs);
        if (lhsStatus.status == OperandStatus.Status.CONSTANT && rhsStatus.status == OperandStatus.Status.CONSTANT)
        {
            Immediate resultImm = foldConstant(inst , (Immediate)lhsStatus.operand, (Immediate)rhsStatus.operand);
            if (resultImm != null)
                markConstant(inst.getDefRegister(), resultImm);
        } else if (lhsStatus.status == OperandStatus.Status.MULTIDEFINED || rhsStatus.status == OperandStatus.Status.MULTIDEFINED)
        {
            markMultiDefined(inst.getDefRegister());
        }
    }
    void evaluate(UnaryInst inst)
    {
        Operand src = inst.getSrc();
        OperandStatus srcStatus = getStatus(src);
        if (srcStatus.status == OperandStatus.Status.CONSTANT)
        {
            Immediate resultImm = foldConstant(inst, (Immediate)srcStatus.operand, null);
            if (resultImm != null)
            {
                markConstant(inst.getDefRegister(), resultImm);
            }
        } else if (srcStatus.status == OperandStatus.Status.MULTIDEFINED)
        {
            markMultiDefined(inst.getDefRegister());
        }
    }
    void evaluate(LoadInst inst)
    {
        markMultiDefined(inst.getDefRegister());
    }
    void evaluate(AllocInst inst)
    {
        markMultiDefined(inst.getDefRegister());
    }
    void evaluate(CallInst inst)
    {
        //DONE : Consider builtin function
        if (inst.getFunction().getBuiltinName() != null)
        {
            // Everything concerning string operation is here!
            Function function = inst.getFunction();
            GlobalVariable thisPointer = inst.getPointer() instanceof GlobalVariable ? (GlobalVariable) inst.getPointer() : null;
            GlobalVariable lhs = inst.getParameterList().size() > 0 && inst.getParameterList().get(0) instanceof GlobalVariable ?
                    (GlobalVariable) inst.getParameterList().get(0) : null;
            GlobalVariable rhs = inst.getParameterList().size() > 1 && inst.getParameterList().get(1) instanceof GlobalVariable ?
                    (GlobalVariable) inst.getParameterList().get(1) : null;
            if (function == irRoot.builtinStringAdd)
            {
                if (lhs != null && rhs != null)
                {
                    String result = irRoot.getStaticStringValMap().get(lhs) + irRoot.getStaticStringValMap().get(rhs);
                    StaticStr strResult = new StaticStr(new GlobalVariable("__str_const_" + (++irRoot.stringConstCnt), true), result);
                    irRoot.addStaticStr(strResult);
                    markConstantStr(inst.getDefRegister(), (GlobalVariable) strResult.getBase());
                } else markMultiDefined(inst.getDefRegister());
            } else if (function == irRoot.builtinStringLT)
            {
                if (lhs != null && rhs != null)
                {
                    int result = irRoot.getStaticStringValMap().get(lhs).compareTo(irRoot.getStaticStringValMap().get(rhs)) < 0 ? 1 : 0;
                    markConstant(inst.getDefRegister(), new Immediate(result));
                } else markMultiDefined(inst.getDefRegister());
            } else if (function == irRoot.builtinStringLEQ)
            {
                if (lhs != null && rhs != null)
                {
                    int result = irRoot.getStaticStringValMap().get(lhs).compareTo(irRoot.getStaticStringValMap().get(rhs)) <= 0 ? 1 : 0;
                    markConstant(inst.getDefRegister(), new Immediate(result));
                } else markMultiDefined(inst.getDefRegister());
            } else if (function == irRoot.builtinStringREQ)
            {
                if (lhs != null && rhs != null)
                {
                    int result = irRoot.getStaticStringValMap().get(lhs).compareTo(irRoot.getStaticStringValMap().get(rhs)) >= 0 ? 1 : 0;
                    markConstant(inst.getDefRegister(), new Immediate(result));
                } else markMultiDefined(inst.getDefRegister());
            } else if (function == irRoot.builtinStringRT)
            {
                if (lhs != null && rhs != null)
                {
                    int result = irRoot.getStaticStringValMap().get(lhs).compareTo(irRoot.getStaticStringValMap().get(rhs)) > 0 ? 1 : 0;
                    markConstant(inst.getDefRegister(), new Immediate(result));
                } else markMultiDefined(inst.getDefRegister());
            } else if (function == irRoot.builtinStringEQ)
            {
                if (lhs != null && rhs != null)
                {
                    int result = irRoot.getStaticStringValMap().get(lhs).compareTo(irRoot.getStaticStringValMap().get(rhs)) == 0 ? 1 : 0;
                    markConstant(inst.getDefRegister(), new Immediate(result));
                } else markMultiDefined(inst.getDefRegister());
            } else if (function == irRoot.builtinStringNEQ)
            {
                if (lhs != null && rhs != null)
                {
                    int result = irRoot.getStaticStringValMap().get(lhs).compareTo(irRoot.getStaticStringValMap().get(rhs)) != 0 ? 1 : 0;
                    markConstant(inst.getDefRegister(), new Immediate(result));
                } else markMultiDefined(inst.getDefRegister());
            } else if (function == irRoot.builtinToString)
            {
                OperandStatus instStr = getStatus(inst.getParameterList().get(0));
                if (instStr.status == OperandStatus.Status.CONSTANT)
                {
                    String result = String.valueOf(((Immediate)instStr.operand).getImm());
                    StaticStr strResult = new StaticStr(new GlobalVariable("__str_const_" + (++irRoot.stringConstCnt), true), result);
                    irRoot.addStaticStr(strResult);
                    markConstantStr(inst.getDefRegister(), (GlobalVariable) strResult.getBase());
                } else markMultiDefined(inst.getDefRegister());
            } else if (function == irRoot.builtinStringSubstring)
            {
                if (thisPointer != null)
                {
                    OperandStatus lhsStatus = getStatus(inst.getParameterList().get(0));
                    OperandStatus rhsStatus = getStatus(inst.getParameterList().get(1));
                    if (lhsStatus.status == OperandStatus.Status.CONSTANT && rhsStatus.status == OperandStatus.Status.CONSTANT)
                    {
                        int l = ((Immediate)lhsStatus.operand).getImm();
                        int r = ((Immediate)rhsStatus.operand).getImm();
                        String result = irRoot.getStaticStringValMap().get(thisPointer).substring(l, r);
                        StaticStr strResult = new StaticStr(new GlobalVariable("__str_const_" + (++irRoot.stringConstCnt), true), result);
                        irRoot.addStaticStr(strResult);
                        markConstantStr(inst.getDefRegister(), (GlobalVariable) strResult.getBase());
                    } else markMultiDefined(inst.getDefRegister());
                } else markMultiDefined(inst.getDefRegister());
            } else if (function == irRoot.builtinStringLength)
            {
                if (thisPointer != null)
                {
                    int result = irRoot.getStaticStringValMap().get(thisPointer).length();
                    markConstant(inst.getDefRegister(), new Immediate(result));
                } else markMultiDefined(inst.getDefRegister());
            } else if (function == irRoot.builtinStringOrd)
            {
                if (thisPointer != null)
                {
                    OperandStatus instPosStatus = getStatus(inst.getParameterList().get(0));
                    if (instPosStatus.status == OperandStatus.Status.CONSTANT)
                    {
                        int pos = ((Immediate)instPosStatus.operand).getImm();
                        if (pos < irRoot.getStaticStringValMap().get(thisPointer).length())
                        {
                            int result = irRoot.getStaticStringValMap().get(thisPointer).charAt(pos);
                            markConstant(inst.getDefRegister(), new Immediate(result));
                        }
                    } else markMultiDefined(inst.getDefRegister());
                } else markMultiDefined(inst.getDefRegister());
            } else if (function == irRoot.builtinStringParseInt)
            {
                if (thisPointer != null)
                {
                    String str = irRoot.getStaticStringValMap().get(thisPointer);
                    int result = 0;
                    char[] chars = str.toCharArray();
                    for (char c : chars)
                    {
                        if (c >= '0' && c <= '9')
                        {
                            result = result * 10 + c - '0';
                        } else break;
                    }
                    markConstant(inst.getDefRegister(), new Immediate(result));
                } else markMultiDefined(inst.getDefRegister());
            }
        } else if (inst.getDefRegister() != null)
            markMultiDefined(inst.getDefRegister());
    }
    void evaluate(BranchInst inst)
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
                markMultiDefined(inst.getDefRegister());
                return;
            } else if (status.status == OperandStatus.Status.CONSTANT)
            {
                if (constImm != null)
                {
                    if (constImm.getImm() != ((Immediate)status.operand).getImm())
                    {
                        markMultiDefined(inst.getDefRegister());
                        return;
                    }
                } else {
                    constImm = (Immediate) status.operand;
                }
            }
        }
        if (constImm != null)
            markConstant(inst.getDefRegister(), constImm);
    }
    OperandStatus getStatus(Operand operand)
    {
        if (valueLattice.containsKey(operand))
            return valueLattice.get(operand);
        OperandStatus status;
        if (operand instanceof Immediate)
            status = new OperandStatus(operand, OperandStatus.Status.CONSTANT);
        else if (operand instanceof GlobalVariable && irRoot.getStaticStringValMap().get(operand) != null)
            status = new OperandStatus(operand, OperandStatus.Status.CONSTANTSTR);
        else if (operand instanceof VirtualRegister && ((VirtualRegister)operand).isParameter)
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
        if (inst instanceof BinaryInst)
        {
            int result;
            switch (((BinaryInst) inst).getOp())
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
        } else if (inst instanceof UnaryInst)
        {
            int result;
            switch (((UnaryInst) inst).getOp())
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
        } else if (inst instanceof CmpInst)
        {
            int result;
            switch (((CmpInst) inst).getOp())
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
            Immediate imm = new Immediate(result);
            imm.setBool();
            return imm;
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

    private void markConstantStr(Register register, GlobalVariable string)
    {
        OperandStatus status = new OperandStatus(string, OperandStatus.Status.CONSTANTSTR);
        OperandStatus oldStatus = getStatus(register);
        if (oldStatus.status == OperandStatus.Status.UNDEFINED)
        {
            valueLattice.replace(register, status);
            SSAList.offer(register);
        }
    }


}
