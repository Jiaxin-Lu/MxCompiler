package Compiler.RISCV.RVInstruction;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVFunction;
import Compiler.RISCV.RVOperand.PhysicalRegister;
import Compiler.RISCV.RVOperand.RVRegister;
import Compiler.RISCV.RVOperand.VirtualRegister;
import Compiler.RISCV.RVVisitor;

import static Compiler.RISCV.RVOperand.PhysicalRegister.*;

public class Call extends RVInstruction
{
    private RVFunction function;
    private int parameterCnt;

    public Call(RVBasicBlock basicBlock, RVFunction function, int parameterCnt)
    {
        super(basicBlock);
        this.function = function;
        this.parameterCnt = parameterCnt;
        calcDefUse();
    }

    public RVFunction getFunction()
    {
        return function;
    }

    public int getParameterCnt()
    {
        return parameterCnt;
    }

    @Override
    public void calcDefUse()
    {
        def.clear();
        used.clear();
        for (int i = 0; i < parameterCnt && i < 8; ++ i)
        {
            used.add(argumentRegisters.get(argumentRegisterNames[i]));
        }
        for (int i = 0; i < callerSaveRegisters.size(); ++ i)
        {
            def.add(callerSaveRegisters.get(callerSaveRegisterNames[i]));
        }
    }

    @Override
    public void replaceUsed(RVRegister oldReg, RVRegister newReg)
    {

    }

    @Override
    public void replaceDef(RVRegister oldReg, RVRegister newReg)
    {

    }

    @Override
    public void accept(RVVisitor visitor)
    {
        visitor.visit(this);
    }

    @Override
    public String toString()
    {
        return indent + "call" + indent + function.getName();
    }
}
