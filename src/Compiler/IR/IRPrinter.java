package Compiler.IR;

import Compiler.IR.IRInstruction.*;
import Compiler.IR.Operand.Immediate;
import Compiler.IR.Operand.Memory;
import Compiler.IR.Operand.Register;

public class IRPrinter implements IRVisitor
{
    private IRRoot irRoot;
    public IRPrinter(IRRoot irRoot)
    {
        this.irRoot = irRoot;
    }
    @Override
    public void visit(IRRoot irRoot)
    {
        
    }
    @Override
    public void visit(Function function){}
    @Override
    public void visit(BasicBlock basicBlock){}
    @Override
    public void visit(Alloc inst){}
    @Override
    public void visit(Branch inst){}
    @Override
    public void visit(Binary inst){}
    @Override
    public void visit(Unary inst){}
    @Override
    public void visit(Call inst){}
    @Override
    public void visit(Move inst){}
    @Override
    public void visit(Load inst){}
    @Override
    public void visit(Store inst){}
    @Override
    public void visit(Cmp inst){}
    @Override
    public void visit(Phi inst){}
    @Override
    public void visit(Push inst){}
    @Override
    public void visit(Pop inst){}
    @Override
    public void visit(Jump inst){}
    @Override
    public void visit(Return inst){}
    @Override
    public void visit(Register register){}
    @Override
    public void visit(Immediate immediate){}
    @Override
    public void visit(Memory memory){}
}
