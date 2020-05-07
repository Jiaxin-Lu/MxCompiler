//package Compiler.Backend;
//
//import Compiler.IR.BasicBlock;
//import Compiler.IR.Function;
//import Compiler.IR.IRInstruction.*;
//import Compiler.IR.IRRoot;
//import Compiler.IR.Operand.*;
//
//import java.util.LinkedList;
//import java.util.List;
//
//import static Compiler.IR.Operand.PhysicalRegister.*;
//
//public class FunctionRegProcessor
//{
//    private IRRoot irRoot;
//
//    public static int argumentRegNumber = argumentVirtualRegisters.size();
//
//    public FunctionRegProcessor(IRRoot irRoot)
//    {
//        this.irRoot = irRoot;
//    }
//
//    public void run()
//    {
//        for (Function function : irRoot.getFunctionMap().values())
//        {
//            loadArguments(function);
//            modifyReturn(function);
//            processInstruction(function);
//        }
//    }
//
//    private void loadArguments(Function function)
//    {
//        List<Register> parameterList = new LinkedList<>();
//        if (function.getInClassThis() != null)
//            parameterList.add(function.getInClassThis());
//        parameterList.addAll(function.getParameterList());
//        for (int i = 0; i < parameterList.size(); i++)
//        {
//            if (i < argumentRegNumber)
//            {
//                function.getEntryBlock().headInst.addPrevInst(new Move(function.getEntryBlock(),
//                        argumentVirtualRegisters.get(i), parameterList.get(i)));
//            } else
//            {
//                StackData mem = new StackData(vrbp, null, new Immediate(0), new Immediate(8 * i + 8));
//                function.getEntryBlock().headInst.addPrevInst(new Load(function.getEntryBlock(),
//                        mem, parameterList.get(i)));
//            }
//        }
//    }
//
//    private void modifyReturn(Function function)
//    {
//        Return ret = (Return) function.getExitBlock().tailInst;
//        if (ret.getReturnValue() != null)
//        {
//            ret.addPrevInst(new Move(function.getExitBlock(), ret.getReturnValue(), vrax));
//            ret.setReturnValue(vrax);
//        }
//    }
//
//    private void processInstruction(Function function)
//    {
//        for (BasicBlock basicBlock : function.getPreOrderBlockList())
//        {
//            for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
//            {
//                if (inst instanceof Call)
//                {
//                    if (((Call) inst).getFunction() == irRoot.builtinStringLength)
//                    {
//                        StackData mem = new StackData((Register) ((Call)inst).getPointer(), null, new Immediate(0), new Immediate(0));
//                        inst.replaceInst(new Load(basicBlock, mem, ((Call)inst).getDst()));
//                        continue;
//                    }
//                    function.calcCallArgumentSize(((Call) inst).getFunction().calcAllParameterSize());
//                    int registerLimit = ((Call) inst).getPointer() == null ? argumentRegNumber : argumentRegNumber - 1;
//                    while (((Call) inst).getParameterList().size() > registerLimit)
//                    {
//                        StackData mem = new StackData(vrsp, null, new Immediate(0),
//                                new Immediate((((Call) inst).getParameterList().size() - registerLimit) * 8));
//                        inst.addPrevInst(new Store(basicBlock, ((Call) inst).getParameterList().removeLast(), mem));
//                    }
//
//                    if (((Call) inst).getPointer() != null)
//                    {
//                        inst.addPrevInst(new Move(basicBlock, ((Call) inst).getPointer(), argumentVirtualRegisters.get(0)));
//                        ((Call) inst).setPointer(argumentVirtualRegisters.get(0));
//                    }
//                    for (int i = 0, j = ((Call) inst).getPointer() == null ? 0 : 1; i < ((Call) inst).getParameterList().size(); i++, j++)
//                    {
//                        inst.addPrevInst(new Move(basicBlock, ((Call) inst).getParameterList().get(i), argumentVirtualRegisters.get(j)));
//                        ((Call) inst).getParameterList().set(i, argumentVirtualRegisters.get(j));
//                    }
//                    inst.resolveUsedRegister();
//                    if (((Call) inst).getDst() != null)
//                    {
//                        inst.addNextInst(new Move(basicBlock, vrax, ((Call) inst).getDst()));
//                        ((Call) inst).setDst(vrax);
//                    }
//                } else if (inst instanceof Binary)
//                {
//                    switch (((Binary) inst).getOp())
//                    {
//                        case SHL:
//                        case SHR:
//                        {
//                            if (((Binary) inst).getRhs() instanceof VirtualRegister)
//                            {
//                                inst.addPrevInst(new Move(basicBlock, ((Binary) inst).getRhs(), vrcx));
//                                ((Binary) inst).setRhs(vrcx);
//                            }
//                            break;
//                        }
//                        case DIV:
//                        case MOD:
//                        {
//                            inst.addPrevInst(new Move(basicBlock, ((Binary) inst).getLhs(), vrax));
//                            inst.addPrevInst(new Move(basicBlock, rdx, vrdx));
//                            inst.addPrevInst(new Move(basicBlock, ((Binary) inst).getRhs(), vrcx));
//                            ((Binary) inst).setLhs(vrax);
//                            ((Binary) inst).setRhs(vrcx);
//                            if (((Binary) inst).getOp() == Binary.Op.DIV)
//                                inst.addNextInst(new Move(basicBlock, vrax, ((Binary) inst).getDst()));
//                            else
//                                inst.addNextInst(new Move(basicBlock, vrdx, ((Binary) inst).getDst()));
//                            inst.addNextInst(new Move(basicBlock, rdx, vrdx));
//                            inst.addNextInst(new Move(basicBlock, rax, vrax));
//                            ((Binary) inst).setDst(vrax);
//                        }
//                        default: break;
//                    }
//                } else if (inst instanceof Alloc)
//                {
//                    inst.addPrevInst(new Move(basicBlock, ((Alloc) inst).getSize(), vrdi));
//                    inst.addNextInst(new Move(basicBlock, vrax, ((Alloc) inst).getDst()));
//                    ((Alloc) inst).setSize(vrdi);
//                    ((Alloc) inst).setDst(vrax);
//                }
//            }
//        }
//    }
//}
