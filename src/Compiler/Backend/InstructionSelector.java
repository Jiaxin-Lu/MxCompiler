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

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

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
    }

    @Override
    public void visit(Function function)
    {
        currentFunction = function.rvFunction;
        //basic block
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            RVBasicBlock rvBasicBlock = new RVBasicBlock(currentFunction, basicBlock.getName());
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
            calleeSavedInFunction[i] = currentFunction.addRegister(callerSaveRegisterNames[i]);
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
                    getRegister(parameterList.get(i)), new StackData((i-8) * 4, 2)));
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
        //do nothing
    }

    @Override
    public void visit(BranchInst inst)
    {

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
                } else if (lhs instanceof Immediate)
                {
                    if (canBeImm(((Immediate) lhs).getImm()))
                    {
                        currentBlock.addInst2Tail(new InstI(currentBlock, opI,
                                dstRV, getRegister(rhs), new RVImmediate(((Immediate) lhs).getImm())));
                    } else
                    {
                        currentBlock.addInst2Tail(new InstR(currentBlock, opR,
                                dstRV, getRegister(lhs), getRegister(rhs)));
                    }
                } else
                {
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
            StackData stackData = new StackData((i-8) * 4);
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

    }

    @Override
    public void visit(StoreInst inst)
    {

    }

    @Override
    public void visit(CmpInst inst)
    {

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
        currentBlock.endThis(new InstJ(currentBlock, inst.getDstBlock().rvBasicBlock));
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
        currentBlock.endThis(new InstJr(currentBlock, allRegisters.get("ra")));
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
}
