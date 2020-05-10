package Compiler.Backend;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.*;
import Compiler.IR.IRInstruction.CallInst;
import Compiler.IR.IRInstruction.LoadInst;
import Compiler.IR.IRInstruction.MoveInst;
import Compiler.IR.IRInstruction.StoreInst;
import Compiler.IR.IRRoot;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.*;
import Compiler.RISCV.*;
import Compiler.RISCV.RVInstruction.*;
import Compiler.RISCV.RVOperand.*;
import Compiler.RISCV.RVOperand.StackData;
import Compiler.Utils.Width;

import java.util.*;

import static Compiler.RISCV.RVOperand.RVPhysicalRegister.*;

public class InstructionSelector implements IRVisitor
{
    private IRRoot irRoot;
    private RVRoot rvRoot;

    private RVFunction currentFunction;
    private RVBasicBlock currentBlock;

    private RVVirtualRegister[] calleeSavedInFunction = new RVVirtualRegister[13];

    public InstructionSelector(IRRoot irRoot)
    {
        this.irRoot = irRoot;
    }

    public RVRoot getRvRoot()
    {
        return rvRoot;
    }

    public void run()
    {
        rvRoot = new RVRoot();
        visit(irRoot);
    }

    private static final int IMM_MIN = -2048;
    private static final int IMM_MAX = 2047;
    private boolean canBeImm(int imm)
    {
        return imm >= IMM_MIN && imm <= IMM_MAX;
    }

    private boolean canBeSHAMT(int imm)
    {
        return imm < 32 && imm >= 0;
    }

    private RVRegister getRegister(Operand operand)
    {
        if (operand instanceof Register)
        {
            RVRegister reg = ((Register) operand).rvRegister;
            if (reg != null) return reg;
            reg = currentFunction.addRegister(operand.getName());
            ((Register) operand).rvRegister = reg;
            return reg;
        } else if (operand instanceof Immediate)
        {
            int imm = ((Immediate) operand).getImm();
            if (((Immediate) operand).isBool())
            {
                if (imm == 0) return allRegisters.get("zero");
                RVVirtualRegister reg = currentFunction.addRegister("imm");
                currentBlock.addInst2Tail(new InstI(currentBlock, InstI.Op.addi, reg, allRegisters.get("zero"), new RVImmediate(1)));
                return reg;
            } else
            {
                if (imm == 0) return allRegisters.get("zero");
                RVVirtualRegister reg = currentFunction.addRegister("imm");
                currentBlock.addInst2Tail(new InstLi(currentBlock, reg, new RVImmediate(imm)));
                return reg;
            }
        } else if (operand instanceof Memory) //static Str
        {
            assert false;
            RVRegister reg = ((Memory) operand).getBase().rvRegister;
            if (reg != null) return reg;
            reg = currentFunction.addRegister(operand.getName());
            ((Memory) operand).getBase().rvRegister = reg;
            return reg;
        }
        return null;
    }

    @Override
    public void visit(IRRoot irRoot)
    {
        for (GlobalVariable globalVariable : irRoot.getGlobalVariableList())
        {
            RVGlobalVariable rvGlobalVariable = new RVGlobalVariable(globalVariable.getName());
            globalVariable.rvGlobalVariable = rvGlobalVariable;
            rvRoot.addGlobalVariable(rvGlobalVariable);
        }
        for (StaticStr staticStr : irRoot.getStaticStrList())
        {
            RVStaticStr str = new RVStaticStr(staticStr.getName(), staticStr.getValue());
            staticStr.rvStaticStr = str;
            rvRoot.addStaticStr(str);
        }
        for (Function function : irRoot.getBuiltinFunctions().values())
        {
            RVFunction rvFunction = new RVFunction(function.getBuiltinName());
            function.rvFunction = rvFunction;
            rvRoot.addBuiltinFunction(rvFunction);
        }
        for (Function function : irRoot.getFunctionMap().values())
        {
            RVFunction rvFunction = new RVFunction(function.getName());
            function.rvFunction = rvFunction;
            rvRoot.addFunction(rvFunction);
        }
        for (Function function : irRoot.getFunctionMap().values())
        {
            function.accept(this);
        }
        for (RVFunction function : rvRoot.getFunctionMap().values())
        {
            if (function.getName().equals("main"))
            {
                function.setName("_main");
            }
            if (function.getName().equals("_init_"))
            {
                function.setName("main");
            }
        }
    }

    @Override
    public void visit(Function function)
    {
        currentFunction = function.rvFunction;
        //basic block
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            RVBasicBlock rvBasicBlock = new RVBasicBlock(currentFunction, getBasicBlockName(basicBlock));
            basicBlock.rvBasicBlock = rvBasicBlock;
            currentFunction.addBlockList(rvBasicBlock);
        }
        currentFunction.setEntryBlock(function.getEntryBlock().rvBasicBlock);
        currentFunction.setExitBlock(function.getExitBlock().rvBasicBlock);

        //add callee saved registers
        currentBlock = currentFunction.getEntryBlock();
        calleeSavedInFunction[12] = currentFunction.addRegister("ra");
        currentBlock.addInst2Tail(new Move(currentBlock, calleeSavedInFunction[12], allRegisters.get("ra")));
        for (int i = 0; i < 12; ++ i)
        {
            RVPhysicalRegister reg = calleeSaveRegisters.get(calleeSaveRegisterNames[i]);
            calleeSavedInFunction[i] = currentFunction.addRegister(calleeSaveRegisterNames[i]);
            currentBlock.addInst2Tail(new Move(currentBlock, calleeSavedInFunction[i], reg));
        }

        //add parameters
        List<Register> parameterList = function.getAllParameterList();
        for (int i = 0; i < parameterList.size() && i < 8; ++ i)
        {
            currentBlock.addInst2Tail(new Move(currentBlock,
                    getRegister(parameterList.get(i)), argumentRegisters.get(argumentRegisterNames[i])));
        }
        for (int i = 8; i < parameterList.size(); ++ i)
        {
            currentBlock.addInst2Tail(new Load(currentBlock,
                    getRegister(parameterList.get(i)), new StackData((i-8) * Width.regWidth, 2)));
        }

        //block
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            basicBlock.accept(this);
        }
    }

    @Override
    public void visit(BasicBlock basicBlock)
    {
        currentBlock = basicBlock.rvBasicBlock;
        for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            inst.accept(this);
    }

    @Override
    public void visit(AllocInst inst)
    {
        //call malloc
        currentBlock.addInst2Tail(new Move(currentBlock, getRegister(inst.getSize()), allRegisters.get("a0")));
        currentBlock.addInst2Tail(new Call(currentBlock, rvRoot.rvMalloc, 1));
        if (inst.getDst() != null)
            currentBlock.addInst2Tail(new Move(currentBlock, allRegisters.get("a0"), getRegister(inst.getDst())));
    }

    @Override
    public void visit(BranchInst inst)
    {
        if (inst.getCond() == null)
        {
            currentBlock.addInst2Tail(new InstJ(currentBlock, inst.getThenBlock().rvBasicBlock));
        } else {
            RVInstruction instruction = inst.getRvInstB();
            if (instruction != null)
            {
                instruction.setCurrentBlock(currentBlock);
                currentBlock.addInst2Tail(instruction);
            } else {
                currentBlock.addInst2Tail(new InstB(currentBlock, InstB.Op.bne,
                        getRegister(inst.getCond()), allRegisters.get("zero"), inst.getThenBlock().rvBasicBlock));
            }
        }
    }

    @Override
    public void visit(BinaryInst inst)
    {
        InstI.Op opI = null;
        InstR.Op opR = null;
        switch (inst.getOp())
        {
            case ADD:
                opI = InstI.Op.addi;
                opR = InstR.Op.add;
                break;
            case SUB:
                opI = InstI.Op.addi;
                opR = InstR.Op.sub;
                break;
            case MUL:
                opR = InstR.Op.mul;
                break;
            case DIV:
                opR = InstR.Op.div;
                break;
            case MOD:
                opR = InstR.Op.rem;
                break;
            case SHL:
                opI = InstI.Op.slli;
                opR = InstR.Op.sll;
                break;
            case SHR:
                opI = InstI.Op.srai;
                opR = InstR.Op.sra;
                break;
            case AND:
                opI = InstI.Op.andi;
                opR = InstR.Op.and;
                break;
            case OR:
                opI = InstI.Op.ori;
                opR = InstR.Op.or;
                break;
            case XOR:
                opI = InstI.Op.xori;
                opR = InstR.Op.xor;
                break;
            default: break;
        }
        RVRegister dstRV = getRegister(inst.getDst());
        Operand lhs = inst.getLhs(), rhs = inst.getRhs();
        switch (inst.getOp())
        {
            case ADD:
                if (lhs instanceof Immediate && !(rhs instanceof Immediate))
                {
                    Operand tmp = lhs;
                    lhs = rhs;
                    rhs = tmp;
                }
                if (rhs instanceof Immediate)
                {
                    if (canBeImm(((Immediate) rhs).getImm()))
                    {
                        currentBlock.addInst2Tail(new InstI(currentBlock, opI,
                                dstRV, getRegister(lhs), new RVImmediate(((Immediate) rhs).getImm())));
                    } else{
                        currentBlock.addInst2Tail(new InstR(currentBlock, opR,
                                dstRV, getRegister(lhs), getRegister(rhs)));
                    }
                } else {
                    currentBlock.addInst2Tail(new InstR(currentBlock, opR,
                            dstRV, getRegister(lhs), getRegister(rhs)));
                }
                break;
            case SUB:
                if (rhs instanceof Immediate)
                {
                    int rhsImm = -((Immediate) rhs).getImm();
                    if (canBeImm(rhsImm))
                    {
                        currentBlock.addInst2Tail(new InstI(currentBlock, opI,
                                dstRV, getRegister(lhs), new RVImmediate(rhsImm)));
                    } else {
                        currentBlock.addInst2Tail(new InstR(currentBlock, opR,
                                dstRV, getRegister(lhs), getRegister(rhs)));
                    }
                } else {
                    currentBlock.addInst2Tail(new InstR(currentBlock, opR,
                            dstRV, getRegister(lhs), getRegister(rhs)));
                }
                break;
            case MUL:
            case DIV:
            case MOD:
                currentBlock.addInst2Tail(new InstR(currentBlock, opR, dstRV, getRegister(lhs), getRegister(rhs)));
                break;
            case SHL:
            case SHR:
                if (rhs instanceof Immediate)
                {
                    int rhsImm = ((Immediate) rhs).getImm();
                    if (canBeSHAMT(rhsImm))
                    {
                        currentBlock.addInst2Tail(new InstI(currentBlock, opI,
                                dstRV, getRegister(lhs), new RVImmediate(rhsImm)));
                    } else{
                        currentBlock.addInst2Tail(new InstR(currentBlock, opR,
                                dstRV, getRegister(lhs), getRegister(rhs)));
                    }
                } else {
                    currentBlock.addInst2Tail(new InstR(currentBlock, opR,
                            dstRV, getRegister(lhs), getRegister(rhs)));
                }
                break;
            case AND:
            case OR:
            case XOR:
                if (lhs instanceof Immediate && !(rhs instanceof Immediate))
                {
                    Operand tmp = lhs;
                    lhs = rhs;
                    rhs = tmp;
                }
                if (rhs instanceof Immediate)
                {
                    int rhsImm = ((Immediate) rhs).getImm();
                    if (canBeImm(rhsImm))
                    {
                        currentBlock.addInst2Tail(new InstI(currentBlock, opI,
                                dstRV, getRegister(lhs), new RVImmediate(rhsImm)));
                    } else {
                        currentBlock.addInst2Tail(new InstR(currentBlock, opR,
                                dstRV, getRegister(lhs), getRegister(rhs)));
                    }
                } else
                {
                    currentBlock.addInst2Tail(new InstR(currentBlock, opR,
                            dstRV, getRegister(lhs), getRegister(rhs)));
                }
                break;
            default: break;
        }
    }

    @Override
    public void visit(UnaryInst inst)
    {
        switch (inst.getOp())
        {
            case NOT:
            {
                //not ~x -> x xor (-1)
                RVRegister dst = getRegister(inst.getDst());
                currentBlock.addInst2Tail(new InstI(currentBlock, InstI.Op.xori, dst, getRegister(inst.getSrc()), new RVImmediate(-1)));
                break;
            }
            case NEG:
            {
                //neg -x -> binary 0 sub x
                RVRegister dst = getRegister(inst.getDst());
                currentBlock.addInst2Tail(new InstR(currentBlock, InstR.Op.sub, dst, getRegister(new Immediate(0)), getRegister(inst.getSrc())));
                break;
            }
            default: break;
        }
    }

    @Override
    public void visit(CallInst inst)
    {
        LinkedList<Operand> parameterList = inst.getAllParameterList();
        for (int i = 0; i < parameterList.size() && i < 8; ++i)
        {
            RVPhysicalRegister reg = argumentRegisters.get(argumentRegisterNames[i]);
            currentBlock.addInst2Tail(new Move(currentBlock,
                    reg, getRegister(parameterList.get(i))));
        }
        List<StackData> stackSlot = new ArrayList<>();
        for (int i = 8; i < parameterList.size(); ++i)
        {
            StackData stackData = new StackData((i-8) * Width.regWidth, 0);
            currentBlock.addInst2Tail(new Store(currentBlock,
                    getRegister(parameterList.get(i)), stackData));
            stackSlot.add(stackData);
        }
        currentFunction.addCallStackSlot(stackSlot);

        currentBlock.addInst2Tail(new Call(currentBlock, inst.getFunction().rvFunction, parameterList.size()));
        if (inst.getDst() != null)
        {
            currentBlock.addInst2Tail(new Move(currentBlock,
                    getRegister(inst.getDst()), allRegisters.get("a0")));
        }
    }

    @Override
    public void visit(MoveInst inst)
    {
        currentBlock.addInst2Tail(new Move(currentBlock,
                getRegister(inst.getDst()), getRegister(inst.getSrc())));
    }

    @Override
    public void visit(LoadInst inst)
    {
        Operand src = inst.getSrc(), dst = inst.getDst();
        if (src instanceof GlobalVariable)
        {
            //dst = load global
            currentBlock.addInst2Tail(new Load(currentBlock, getRegister(dst), getRegister(src), new RVImmediate(0)));
        } else if (src instanceof StaticStr)
        {
            assert false;
            //shouldn't happen
        } else
        {
            currentBlock.addInst2Tail(new Load(currentBlock, getRegister(dst), getRegister(src), new RVImmediate(0)));
        }
    }

    @Override
    public void visit(StoreInst inst)
    {
        Operand src = inst.getSrc(), dst = inst.getDst();
        if (dst instanceof GlobalVariable)
        {
            currentBlock.addInst2Tail(new Store(currentBlock, getRegister(src), getRegister(dst), new RVImmediate(0)));
        } else if (dst instanceof StaticStr)
        {
            assert false;
            //shouldn't happen
        } else {
            currentBlock.addInst2Tail(new Store(currentBlock, getRegister(src), getRegister(dst), new RVImmediate(0)));
        }
    }

    @Override
    public void visit(CmpInst inst)
    {
        if (handleCmpWithBranch(inst)) return;
        Register dst = (Register) inst.getDst();
        Operand lhs = inst.getLhs(), rhs = inst.getRhs();
        switch (inst.getOp())
        {
            case EQ:
            case NEQ:
            {
                RVRegister dstRV = getRegister(dst);
                if (lhs instanceof Immediate && ((Immediate) lhs).isNull())
                {
                    currentBlock.addInst2Tail(new CMPz(currentBlock,
                            inst.getOp() == CmpInst.Op.EQ ? CMPz.Op.seqz : CMPz.Op.snez, dstRV, getRegister(rhs)));
                } else if (rhs instanceof Immediate && ((Immediate) rhs).isNull()) {
                    currentBlock.addInst2Tail(new CMPz(currentBlock,
                            inst.getOp() == CmpInst.Op.EQ ? CMPz.Op.seqz : CMPz.Op.snez, dstRV, getRegister(lhs)));
                } else {
                    if (lhs instanceof Immediate && !(rhs instanceof Immediate))
                    {
                        Operand tmp = lhs;
                        lhs = rhs;
                        rhs = tmp;
                    }
                    RVVirtualRegister xorRV = (RVVirtualRegister) getRegister(dst);
                    if (rhs instanceof Immediate)
                    {
                        int rhsImm = ((Immediate) rhs).getImm();
                        if (canBeImm(rhsImm))
                        {
                            currentBlock.addInst2Tail(new InstI(currentBlock,
                                    InstI.Op.xori, xorRV, getRegister(lhs), new RVImmediate(rhsImm)));
                        } else {
                            currentBlock.addInst2Tail(new InstR(currentBlock,
                                    InstR.Op.xor, xorRV, getRegister(lhs), getRegister(rhs)));
                        }
                    } else {
                        currentBlock.addInst2Tail(new InstR(currentBlock,
                                InstR.Op.xor, xorRV, getRegister(lhs), getRegister(rhs)));
                    }
                    currentBlock.addInst2Tail(new CMPz(currentBlock,
                            inst.getOp() == CmpInst.Op.EQ ? CMPz.Op.seqz : CMPz.Op.snez, dstRV, xorRV));
                }
                break;
            }
            case LT:
            case REQ:
            {
                RVRegister dstRV = getRegister(dst);
                if (rhs instanceof Immediate)
                {
                    int rhsImm = ((Immediate) rhs).getImm();
                    if (canBeImm(rhsImm))
                    {
                        currentBlock.addInst2Tail(new InstI(currentBlock,
                                InstI.Op.slti, dstRV, getRegister(lhs), new RVImmediate(rhsImm)));
                    } else {
                        currentBlock.addInst2Tail(new InstR(currentBlock,
                                InstR.Op.slt, dstRV, getRegister(lhs), getRegister(rhs)));
                    }
                } else {
                    currentBlock.addInst2Tail(new InstR(currentBlock,
                            InstR.Op.slt, dstRV, getRegister(lhs), getRegister(rhs)));
                }
                if (inst.getOp() == CmpInst.Op.REQ)
                {
                    RVRegister xorRV = getRegister(dst);
                    currentBlock.addInst2Tail(new InstI(currentBlock,
                            InstI.Op.xori, xorRV, dstRV, new RVImmediate(1)));
                }
                break;
            }
            case LEQ:
            case RT:
            {
                RVRegister dstRV = getRegister(dst);
                if (lhs instanceof Immediate)
                {
                    int lhsImm = ((Immediate) lhs).getImm();
                    if (canBeImm(lhsImm))
                    {
                        currentBlock.addInst2Tail(new InstI(currentBlock,
                                InstI.Op.slti, dstRV, getRegister(rhs), new RVImmediate(lhsImm)));
                    } else {
                        currentBlock.addInst2Tail(new InstR(currentBlock,
                                InstR.Op.slt, dstRV, getRegister(rhs), getRegister(lhs)));
                    }
                } else {
                    currentBlock.addInst2Tail(new InstR(currentBlock,
                            InstR.Op.slt, dstRV, getRegister(rhs), getRegister(lhs)));
                }
                if (inst.getOp() == CmpInst.Op.LEQ)
                {
                    RVRegister xorRV = getRegister(dst);
                    currentBlock.addInst2Tail(new InstI(currentBlock,
                            InstI.Op.xori, xorRV, dstRV, new RVImmediate(1)));
                }
                break;
            }
            default: break;
        }
    }

    private boolean handleCmpWithBranch(CmpInst inst)
    {
        Register reg = (Register) inst.getDst();
        for (IRInstruction instruction : reg.getUsedInst())
        {
            if (!(instruction instanceof BranchInst)) return false;
        }
        Operand lhs = inst.getLhs(), rhs = inst.getRhs();
        InstB.Op op = null;
        switch (inst.getOp())
        {
            case EQ:
                op = InstB.Op.beq; break;
            case NEQ:
                op = InstB.Op.bne; break;
            case LT:
                op = InstB.Op.blt; break;
            case LEQ:
                op = InstB.Op.ble; break;
            case REQ:
                op = InstB.Op.bge; break;
            case RT:
                op = InstB.Op.bgt; break;
            default: break;
        }
        for (IRInstruction instruction : reg.getUsedInst())
        {
            ((BranchInst) instruction).setRvInstB(new InstB(currentBlock, op, getRegister(lhs), getRegister(rhs),
                    ((BranchInst) instruction).getThenBlock().rvBasicBlock));
        }
        return true;
    }

    @Override
    public void visit(Phi inst)
    {
        //do nothing
    }

    @Override
    public void visit(Push inst)
    {
        //do nothing
    }

    @Override
    public void visit(Pop inst)
    {
        //do nothing
    }

    @Override
    public void visit(JumpInst inst)
    {
        currentBlock.addInst2Tail(new InstJ(currentBlock, inst.getDstBlock().rvBasicBlock));
    }

    @Override
    public void visit(ReturnInst inst)
    {
        if (inst.getReturnValue() != null)
        {
            currentBlock.addInst2Tail(new Move(currentBlock,
                    allRegisters.get("a0"), getRegister(inst.getReturnValue())));
        }

        //callee saved
        for (int i = 11; i >= 0; --i)
        {
            RVPhysicalRegister reg = calleeSaveRegisters.get(calleeSaveRegisterNames[i]);
            currentBlock.addInst2Tail(new Move(currentBlock,
                    reg, calleeSavedInFunction[i]));
        }
        currentBlock.addInst2Tail(new Move(currentBlock,
                allRegisters.get("ra"), calleeSavedInFunction[12]));
        currentBlock.addInst2Tail(new InstJr(currentBlock, allRegisters.get("ra")));
    }

    @Override
    public void visit(Register register)
    {
        //do nothing
    }

    @Override
    public void visit(Immediate immediate)
    {
        //do nothing
    }

    @Override
    public void visit(Memory memory)
    {
        //do nothing
    }



    private Map<String, Integer> basicBlockNameID = new HashMap<>();
    private Map<BasicBlock, String> basicBlockMap = new HashMap<>();

    private String getID(String name, Map<String, Integer> idMap)
    {
        int nameId = idMap.getOrDefault(name, 0) + 1;
        idMap.put(name, nameId);
        if (nameId == 1)
            return name;
        else return name + '_' + nameId;
    }

    private String getBasicBlockName(BasicBlock basicBlock)
    {
        String id = basicBlockMap.get(basicBlock);
        if (id == null)
        {
            if (basicBlock.getName() == null)
            {
                id = getID("_basic_block", basicBlockNameID);
            } else {
                id = getID(basicBlock.getName(), basicBlockNameID);
            }
            basicBlockMap.put(basicBlock, id);
        }
        return id;
    }
}
