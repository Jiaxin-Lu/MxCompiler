package Compiler.IR;

import Compiler.IR.IRInstruction.*;
import Compiler.IR.Operand.*;
import Compiler.Utils.Width;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;

public class IRPrinter implements IRVisitor
{
    private IRRoot irRoot;
    private PrintStream output;

    private Map<VirtualRegister, String> virtualRegisterMap= new HashMap<>();
    private Map<BasicBlock, String> basicBlockMap = new HashMap<>();
    private Map<String, Integer> virtualRegisterIDMap = new HashMap<>();
    private Map<String, Integer> basicBlockIDMap = new HashMap<>();

    public IRPrinter(IRRoot irRoot)
    {
        this.irRoot = irRoot;
    }

    private String getID(String name, Map<String, Integer> idMap)
    {
        int nameId = idMap.getOrDefault(name, 0) + 1;
        idMap.put(name, nameId);
        if (nameId == 1)
            return name;
        else return name + '_' + nameId;
    }

    private String getBasicBlockID(BasicBlock basicBlock)
    {
        String id = basicBlockMap.get(basicBlock);
        if (id == null)
        {
            if (basicBlock.getName() == null)
            {
                id = getID("_basic_block", basicBlockIDMap);
            } else
            {
                id = getID(basicBlock.getName(), basicBlockIDMap);
            }
            basicBlockMap.put(basicBlock, id);
        }
        return id;
    }

    private String getRegisterID(Register register)
    {
        if (register instanceof PhysicalRegister)
        {
            return register.getName();
        } else if (register instanceof VirtualRegister)
        {
            String id = virtualRegisterMap.get(register);
            if (id == null)
            {
                if (register.getName() == null)
                {
                    id = getID("_virtual_register", virtualRegisterIDMap);
                } else
                {
                    id = getID(register.getName(), virtualRegisterIDMap);
                }
                virtualRegisterMap.put((VirtualRegister) register, id);
            }
            return id;
        } else return null;
    }

    @Override
    public void visit(IRRoot irRoot)
    {
        for (GlobalVariable globalVariable : irRoot.getGlobalVariableList())
        {
            output.printf("@%s", getRegisterID(globalVariable));
        }

        for (StaticStr staticStr : irRoot.getStaticStrList())
        {
            output.printf("@%s = \"%s\"", getRegisterID(staticStr.getBase()), staticStr.getValue());
        }
        output.println();
        for (Function function : irRoot.getFunctionMap().values())
        {
            function.accept(this);
        }
    }
    @Override
    public void visit(Function function)
    {
        virtualRegisterMap = new HashMap<>();
        virtualRegisterIDMap = new HashMap<>();
        if (function.getReturnList().get(0).getReturnValue() == null)
            output.printf("void %s ", function.getName());
        else
            output.printf("func %s ", function.getName());
        for (Register register : function.getParameterList())
        {
            output.printf("$%s ", getRegisterID(register));
        }
        output.println("{");
        for (BasicBlock basicBlock : function.getPostOrderBlockList())
        {
            basicBlock.accept(this);
        }
        output.println("}");
        output.println();
    }
    @Override
    public void visit(BasicBlock basicBlock)
    {
        output.println("%" + getBasicBlockID(basicBlock) + ":");
        for (IRInstruction instruction = basicBlock.headInst; instruction != null; instruction = instruction.getNextInst())
        {
            instruction.accept(this);
        }
    }
    @Override
    public void visit(Alloc inst)
    {
        output.print("    ");
        inst.getDst().accept(this);
        output.print(" = alloc ");
        inst.getSize().accept(this);
        output.println();
    }
    @Override
    public void visit(Branch inst)
    {
        output.print("    br ");
        inst.getCond().accept(this);
        output.println(" %" + getBasicBlockID(inst.getThenBlock()) + " %" + getBasicBlockID(inst.getElseBlock()));
    }
    @Override
    public void visit(Binary inst)
    {
        output.print("    ");
        inst.getDst().accept(this);
        switch (inst.getOp())
        {
            case OR:
                output.print(" = or ");
                break;
            case AND:
                output.print(" = and ");
                break;
            case DIV:
                output.print(" = div ");
                break;
            case MOD:
                output.print(" = mod ");
                break;
            case MUL:
                output.print(" = mul ");
                break;
            case SHL:
                output.print(" = shl ");
                break;
            case SHR:
                output.print(" = shr ");
                break;
            case ADD:
                output.print(" = add ");
                break;
            case SUB:
                output.print(" = sub ");
                break;
            case XOR:
                output.print(" = xor ");
                break;
            default:
                break;
        }
        inst.getLhs().accept(this);
        output.print(" ");
        inst.getRhs().accept(this);
        output.println();
    }
    @Override
    public void visit(Unary inst)
    {
        output.print("    ");
        inst.getDst().accept(this);
        switch (inst.getOp())
        {
            case NOT:
                output.print(" = not ");
                break;
            case NEG:
                output.print(" = neg ");
                break;
            default:
                break;
        }
        inst.getSrc().accept(this);
        output.println();
    }
    @Override
    public void visit(Call inst)
    {
        output.print("    ");
        if (inst.getDst() != null)
        {
            inst.getDst().accept(this);
            output.print(" = ");
        }
        output.printf("call %s ", inst.getFunction().getName());
        if (inst.getPointer() != null)
        {
            inst.getPointer().accept(this);
            output.print(" ");
        }
        for (Register register : inst.getFunction().getParameterList())
        {
            register.accept(this);
            output.print(" ");
        }
        output.println();
    }
    @Override
    public void visit(Move inst)
    {
        output.print("    ");
        inst.getDst().accept(this);
        output.print(" = move ");
        inst.getSrc().accept(this);
        output.println();
    }
    @Override
    public void visit(Load inst)
    {
        output.print("    ");
        inst.getDst().accept(this);
        output.print(" = load " + Width.regWidth + " "); //regWidth
        inst.getSrc().accept(this);
        output.print(" 0");
        output.println();
    }
    @Override
    public void visit(Store inst)
    {
        output.print("    store " + Width.regWidth + " "); //regWidth
        inst.getSrc().accept(this);
        output.print(" ");
        inst.getDst().accept(this);
        output.print(" 0"); //offset is 0
        output.println();
    }
    @Override
    public void visit(Cmp inst)
    {
        output.print("    ");
        inst.getDst().accept(this);
        switch (inst.getOp())
        {
            case LT:
                output.print(" = slt ");
                break;
            case LEQ:
                output.print(" = slq ");
                break;
            case EQ:
                output.print(" = seq ");
                break;
            case REQ:
                output.print(" = sge ");
                break;
            case RT:
                output.print(" = sgt ");
                break;
            case NEQ:
                output.print(" = sne ");
                break;
            default:
                break;
        }
        inst.getLhs().accept(this);
        output.print(" ");
        inst.getRhs().accept(this);
        output.println();
    }
    @Override
    public void visit(Phi inst)
    {
        //won't access
    }
    @Override
    public void visit(Push inst)
    {
        //won't access
    }
    @Override
    public void visit(Pop inst)
    {
        //won't access
    }
    @Override
    public void visit(Jump inst)
    {
        output.println("    jump " + "%" + getBasicBlockID(inst.getDstBlock()));
    }
    @Override
    public void visit(Return inst)
    {
        output.print("    ret ");
        if (inst.getReturnValue() != null)
            inst.getReturnValue().accept(this);
        output.println();
    }
    @Override
    public void visit(Register register)
    {
        if (register instanceof GlobalVariable)
            output.print("@" + getRegisterID(register));
        else output.print("$" + getRegisterID(register));
    }
    @Override
    public void visit(Immediate immediate)
    {
        output.print(immediate.getImm());
    }
    @Override
    public void visit(Memory memory)
    {
        output.print("@" + getRegisterID(memory.getBase()));
    }
}
