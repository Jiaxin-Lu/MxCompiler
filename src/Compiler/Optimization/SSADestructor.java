package Compiler.Optimization;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.*;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.Immediate;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Value;
import Compiler.IR.Operand.VirtualRegister;

import java.util.*;

public class SSADestructor extends Pass
{
    static class CopiedInst
    {
        public Operand src;
        public VirtualRegister dst;
        public CopiedInst(VirtualRegister dst, Operand src)
        {
            this.src = src;
            this.dst = dst;
        }
    }

    private Map<BasicBlock, List<CopiedInst>> parallelCopy = new HashMap<>();

    public SSADestructor(IRRoot irRoot)
    {
        super(irRoot);
    }

    @Override
    public boolean run()
    {
        for (Function function : irRoot.getFunctionMap().values())
        {
            copyAndRemovePhiInst(function);
            function.calcPreOrderBlockList();
            PCS(function);
        }
        return true;
    }

    private void copyAndRemovePhiInst(Function function)
    {
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            if (!parallelCopy.containsKey(basicBlock))
                parallelCopy.put(basicBlock, new LinkedList<>());
        }
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            List<BasicBlock> predecessors = new LinkedList<>(basicBlock.getPredecessors());
            Map<BasicBlock, List<CopiedInst>> pCopy = new HashMap<>();
            for (BasicBlock predecessor : predecessors)
            {
                if (predecessor.getSuccessors().size() > 1)
                {
                    BasicBlock basicBlockCopy = new BasicBlock(function, "_parallel_copy_");
                    basicBlockCopy.endThis(new JumpInst(basicBlockCopy, basicBlock));
                    ((BranchInst) predecessor.tailInst).replaceTargetBlock(basicBlock, basicBlockCopy);
                    predecessor.getSuccessors().remove(basicBlock);
                    predecessor.getSuccessors().add(basicBlockCopy);

                    basicBlockCopy.getPredecessors().add(predecessor);
                    basicBlockCopy.getSuccessors().add(basicBlock);

                    basicBlock.getPredecessors().remove(predecessor);
                    basicBlock.getPredecessors().add(basicBlockCopy);
                    parallelCopy.computeIfAbsent(basicBlockCopy, t -> new LinkedList<>());
                    pCopy.put(predecessor, parallelCopy.get(basicBlockCopy));
                } else pCopy.put(predecessor, parallelCopy.get(predecessor));
            }

            IRInstruction inst = basicBlock.headInst;
            for (; inst instanceof Phi; inst = inst.getNextInst())
            {
                for (Map.Entry<BasicBlock, Operand> entry : ((Phi) inst).getPath().entrySet())
                {
                    BasicBlock block = entry.getKey();
                    Operand reg = entry.getValue();
                    if (pCopy.get(block) == null)
                        System.err.println("pCopy.get(block) == null " + block.getName());
                    pCopy.get(block).add(new CopiedInst((VirtualRegister) ((Phi) inst).getDst(), reg == null ? new Immediate(0) : reg));
                }
            }
            basicBlock.headInst = inst;
            basicBlock.headInst.setPrevInst(null);
        }
    }

    private void PCS(Function function)
    {
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            copySequentialization(basicBlock);
//            parallelCopySequentialization(basicBlock);
        }
    }

    private void copySequentialization(BasicBlock basicBlock)
    {
        for (CopiedInst inst : parallelCopy.get(basicBlock))
        {
            if (inst.src instanceof VirtualRegister)
            {
                if (inst.src != inst.dst)
                {
                    basicBlock.tailInst.addPrevInst(new MoveInst(basicBlock, inst.src, inst.dst));
                } else {
                    VirtualRegister n = new Value("_breaker_");
                    basicBlock.tailInst.addPrevInst(new MoveInst(basicBlock, inst.src, n));
                    basicBlock.tailInst.addPrevInst(new MoveInst(basicBlock, n, inst.dst));
                }
            }
        }
        for (CopiedInst inst : parallelCopy.get(basicBlock))
        {
            if (inst.src instanceof Immediate)
            {
                basicBlock.tailInst.addPrevInst(new MoveInst(basicBlock, inst.src, inst.dst));
            }
        }
    }

    // It seems that this doesn't work well, why?
    private void parallelCopySequentialization(BasicBlock basicBlock)
    {
        Queue<VirtualRegister> ready = new LinkedList<>();
        Queue<VirtualRegister> todo = new LinkedList<>();
        Map<VirtualRegister, VirtualRegister> pred = new HashMap<>();
        Map<VirtualRegister, VirtualRegister> loc = new HashMap<>();
        VirtualRegister n = new Value("_fresh_variable_");
        pred.put(n, null);
        for (CopiedInst inst : parallelCopy.get(basicBlock))
        if (inst.src instanceof VirtualRegister)
        {
            loc.put(inst.dst, null);
            pred.put((VirtualRegister) inst.src, null);
        }
        for (CopiedInst inst : parallelCopy.get(basicBlock))
        if (inst.src instanceof VirtualRegister)
        {
            loc.put((VirtualRegister) inst.src, (VirtualRegister) inst.src);
            pred.put(inst.dst, (VirtualRegister) inst.src);
            todo.offer(inst.dst);
        }
        for (CopiedInst inst : parallelCopy.get(basicBlock))
        if (inst.src instanceof VirtualRegister && loc.get(inst.dst) == null)
        {
            ready.offer(inst.dst);
        }
        while (!todo.isEmpty())
        {
            while (!ready.isEmpty())
            {
                VirtualRegister b = ready.poll();
                VirtualRegister a = pred.get(b);
                VirtualRegister c = loc.get(a);
                basicBlock.tailInst.addPrevInst(new MoveInst(basicBlock, c, b));
                loc.put(a, b);
                if (a == c && pred.get(a) != null) ready.offer(a);
            }
            VirtualRegister b = todo.poll();
            if (b == loc.get(pred.get(b)))
            {
                basicBlock.tailInst.addPrevInst(new MoveInst(basicBlock, b, n));
                loc.put(b, n);
                ready.offer(b);
            }
        }
        for (CopiedInst inst : parallelCopy.get(basicBlock))
        if (inst.src instanceof Immediate)
        {
            basicBlock.tailInst.addPrevInst(new MoveInst(basicBlock, inst.src, inst.dst));
        }
    }
}
