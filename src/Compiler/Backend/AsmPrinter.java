package Compiler.Backend;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.*;
import Compiler.IR.IRRoot;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Immediate;
import Compiler.IR.Operand.Memory;
import Compiler.IR.Operand.Register;

import java.io.PrintStream;

public class AsmPrinter implements IRVisitor
{
    private PrintStream output;
    private IRRoot irRoot;

    public AsmPrinter(IRRoot irRoot, PrintStream output)
    {
        this.irRoot = irRoot;
        this.output = output;
    }

    @Override
    public void visit(IRRoot irRoot)
    {}
    @Override
    public void visit(Function function)
    {}
    @Override
    public void visit(BasicBlock basicBlock)
    {}
    @Override
    public void visit(Alloc inst)
    {}
    @Override
    public void visit(Branch inst)
    {}
    @Override
    public void visit(Binary inst)
    {}
    @Override
    public void visit(Unary inst)
    {}
    @Override
    public void visit(Call inst)
    {}
    @Override
    public void visit(Move inst)
    {}
    @Override
    public void visit(Load inst)
    {}
    @Override
    public void visit(Store inst)
    {}
    @Override
    public void visit(Cmp inst)
    {}
    @Override
    public void visit(Phi inst)
    {}
    @Override
    public void visit(Push inst)
    {}
    @Override
    public void visit(Pop inst)
    {}
    @Override
    public void visit(Jump inst)
    {}
    @Override
    public void visit(Return inst)
    {}
    @Override
    public void visit(Register register)
    {}
    @Override
    public void visit(Immediate immediate)
    {}
    @Override
    public void visit(Memory memory)
    {}
}
