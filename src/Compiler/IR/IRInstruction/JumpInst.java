package Compiler.IR.IRInstruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;

import java.util.Map;

public class JumpInst extends IRInstruction
{
    private BasicBlock dstBlock;
    public JumpInst(BasicBlock basicBlock, BasicBlock dstBlock)
    {
        super(basicBlock);
        this.dstBlock = dstBlock;
        resolveUsedRegister();
    }

    public BasicBlock getDstBlock()
    {
        return dstBlock;
    }

    public void setDstBlock(BasicBlock dstBlock)
    {
        this.dstBlock = dstBlock;
    }

    @Override
    public Register getDefRegister()
    {
        return null;
    }

    @Override
    public void setDefRegister(Register register)
    {
    }

    @Override
    public void resolveUsedRegister()
    {
        usedRegister.clear();
    }

    @Override
    public void replaceUsedRegister(Operand oldOperand, Operand newOperand)
    {

    }

    @Override
    public void setUsedRegister(Map<Register, Register> registerMap)
    {
    }

    @Override
    public IRInstruction copyInst(Map<BasicBlock, BasicBlock> basicBlockMap, Map<Operand, Operand> registerMap)
    {
        return new JumpInst(basicBlockMap.getOrDefault(currentBlock, currentBlock),
                basicBlockMap.getOrDefault(dstBlock, dstBlock));
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }

    @Override
    public void renameUsedRegisterSSA()
    {

    }

    @Override
    public void renameDstRegisterSSA()
    {
        
    }

//    @Override
//    public void calcDefUse()
//    {
//        used.clear();
//        def.clear();
//    }
//
//    @Override
//    public void replaceDef(VirtualRegister oldReg, VirtualRegister newReg)
//    {
//
//    }
//
//    @Override
//    public void replaceUsed(VirtualRegister oldReg, VirtualRegister newReg)
//    {
//
//    }
}
