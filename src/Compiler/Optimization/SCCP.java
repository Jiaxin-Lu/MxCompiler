package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.*;
import Compiler.IR.IRRoot;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.*;

import java.util.*;

//Sparse Conditional Constant Propagation
public class SCCP extends Pass implements IRVisitor
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

    private BasicBlock currentBlock;

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
                inst.accept(this);
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
        currentBlock = function.getEntryBlock();
        markUnExecuted(function.getEntryBlock());
        if (function.getInClassThis() != null)
        {
            markMultiDefined(function.getInClassThis());
        }
        for (Register register : function.getParameterList())
        {
            markMultiDefined(register);
        }
        while (!CFGList.isEmpty() || !SSAList.isEmpty())
        {
            while (!CFGList.isEmpty())
            {
                BasicBlock block = CFGList.poll();
                currentBlock = block;
                for (IRInstruction inst = block.headInst; inst != null; inst = inst.getNextInst())
                {
                    inst.accept(this);
                }
            }
            while (!SSAList.isEmpty())
            {
                Register reg = SSAList.poll();
                for (IRInstruction inst : used.get(reg))
                {
                    inst.accept(this);
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
                if (inst instanceof MoveInst && ((MoveInst) inst).getSrc() instanceof Immediate) continue;
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

    @Override
    public void visit(IRRoot irRoot)
    {
        //no access
    }

    @Override
    public void visit(Function function)
    {
        //no access
    }

    @Override
    public void visit(BasicBlock basicBlock)
    {
        //no access
    }

    @Override
    public void visit(AllocInst inst)
    {
        markMultiDefined(inst.getDefRegister());
    }

    @Override
    public void visit(BranchInst inst)
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

    @Override
    public void visit(BinaryInst inst)
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

    @Override
    public void visit(UnaryInst inst)
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

    @Override
    public void visit(CallInst inst)
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
                    //                    result = "\"" + result + "\"";
                    StaticStr strResult = new StaticStr(new GlobalVariable("__str_const_" + (++irRoot.stringConstCnt), true), result);
                    strResult.isSCCP = true;
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
                    //                    result = "\"" + result + "\"";
                    StaticStr strResult = new StaticStr(new GlobalVariable("__str_const_" + (++irRoot.stringConstCnt), true), result);
                    strResult.isSCCP = true;
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
                        //                        result = "\"" + result + "\"";
                        StaticStr strResult = new StaticStr(new GlobalVariable("__str_const_" + (++irRoot.stringConstCnt), true), result);
                        strResult.isSCCP = true;
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

    @Override
    public void visit(MoveInst inst)
    {
        Operand src = inst.getSrc();
        OperandStatus srcStatus = getStatus(src);
        if (srcStatus.status == OperandStatus.Status.CONSTANT)
        {
            markConstant((Register) inst.getDst(), (Immediate) srcStatus.operand);
        } else if (srcStatus.status == OperandStatus.Status.MULTIDEFINED)
        {
            markMultiDefined(inst.getDst());
        }
    }

    @Override
    public void visit(LoadInst inst)
    {
        markMultiDefined(inst.getDefRegister());
    }

    @Override
    public void visit(StoreInst inst)
    {

    }

    @Override
    public void visit(CmpInst inst)
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

    @Override
    public void visit(Phi inst)
    {
        Immediate constImm = null;
        for (Map.Entry<BasicBlock, Operand> path : inst.getPath().entrySet())
        {
            BasicBlock basicBlock = path.getKey();
            if (!unExecutedBlock.contains(basicBlock))
            {
                markMultiDefined(inst.getDefRegister());
                return;
            }
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

    @Override
    public void visit(JumpInst inst)
    {
        markUnExecuted(inst.getDstBlock());
    }

    @Override
    public void visit(ReturnInst inst)
    {

    }

    @Override
    public void visit(Register register)
    {

    }

    @Override
    public void visit(Immediate immediate)
    {

    }

    @Override
    public void visit(Memory memory)
    {

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
