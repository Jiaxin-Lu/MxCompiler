package Compiler.Backend;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRInstruction.*;
import Compiler.IR.IRRoot;
import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.PhysicalRegister;
import Compiler.IR.Operand.VirtualRegister;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;
import java.util.Stack;

import static Compiler.IR.Operand.PhysicalRegister.*;

public class RegisterAllocator
{
    private class Edge
    {
        VirtualRegister u, v;
        public Edge(VirtualRegister u, VirtualRegister v)
        {
            this.u = u;
            this.v = v;
        }

        @Override
        public boolean equals(Object o)
        {
            if (o instanceof Edge)
                return u == ((Edge) o).u && v == ((Edge) o).v;
            else return false;
        }

        @Override
        public int hashCode()
        {
            return u.hashCode() ^ v.hashCode();
        }
    }

    private static final int K = 14;

    private IRRoot irRoot;

    private Set<VirtualRegister> preColored = new HashSet<>();
    private Set<VirtualRegister> initial = new HashSet<>();
    private Set<VirtualRegister> simplifyWorkList = new HashSet<>();
    private Set<VirtualRegister> freezeWorkList = new HashSet<>();
    private Set<VirtualRegister> spillWorkList = new HashSet<>();
    private Set<VirtualRegister> spilledNodes = new HashSet<>();
    private Set<VirtualRegister> coalescedNodes = new HashSet<>();
    private Set<VirtualRegister> coloredNodes = new HashSet<>();

    private Stack<VirtualRegister> selectStack = new Stack<>();

    private Set<PhysicalRegister> colors = new HashSet<>();

    private Set<Move> workListMoves = new HashSet<>();
    private Set<Move> activeMoves = new HashSet<>();
    private Set<Move> coalescedMoves = new HashSet<>();
    private Set<Move> constrainedMoves = new HashSet<>();
    private Set<Move> frozenMoves = new HashSet<>();

    private Set<Edge> adjSet = new HashSet<>();

    public RegisterAllocator(IRRoot irRoot)
    {
        this.irRoot = irRoot;
        preColored.addAll(allVirtualRegisters);
        colors.addAll(allRegisters);
        colors.remove(rsp);
        colors.remove(rbp);
    }

    public void run()
    {
        for (Function function : irRoot.getFunctionMap().values())
        {
            allocate(function);
        }
    }

    private void init()
    {
        //TODO : CLEAR EVERYTHING
    }

    public void allocate(Function function)
    {
        boolean isChanged = true;
        while (isChanged)
        {
            isChanged = false;
            init();
            new LivenessAnalysis(function).run();
            build(function);
            makeWorkList();
            do
            {
                if (!simplifyWorkList.isEmpty())
                {
                    Simplify();
                } else if (!workListMoves.isEmpty())
                {
                    Coalesce();
                } else if (!freezeWorkList.isEmpty())
                {
                    Freeze();
                } else if (!spillWorkList.isEmpty())
                {
                    SelectSpill();
                }
            } while (!(simplifyWorkList.isEmpty() && workListMoves.isEmpty()
                    && freezeWorkList.isEmpty() && spillWorkList.isEmpty()));
            assignColors();
            if (!spilledNodes.isEmpty())
            {
                isChanged = true;
                rewriteProgram(function);
            }
        }
    }

    private void build(Function function)
    {
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
            for (IRInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            {
                initial.addAll(inst.def);
                initial.addAll(inst.used);
            }
        initial.removeAll(preColored);
        initial.remove(vrsp);
        initial.remove(vrbp);
        for (VirtualRegister virtualRegister : initial)
        {
            virtualRegister.clearAllocInfo();
            virtualRegister.degree = 0;
            virtualRegister.color = null;
        }
        for (VirtualRegister virtualRegister : preColored)
        {
            virtualRegister.clearAllocInfo();
            virtualRegister.degree = 0x3f3f3f3f;
        }
        for (BasicBlock basicBlock : function.getPreOrderBlockList())
        {
            Set<VirtualRegister> live = new HashSet<>(basicBlock.liveOut);
            for (IRInstruction inst = basicBlock.tailInst; inst != null; inst = inst.getPrevInst())
            {
                if (inst instanceof Move)
                {
                    if ((((Move) inst).getDst() instanceof VirtualRegister) && !(((Move) inst).getSrc() instanceof PhysicalRegister))
                    {
                        if (((Move) inst).getSrc() == ((Move) inst).getDst())
                        {
                            inst.removeThis();
                            continue;
                        }
                        Set<VirtualRegister> tmp = new HashSet<>(live);
                        tmp.retainAll(inst.def);
                        if (tmp.isEmpty())
                        {
                            inst.removeThis();
                            continue;
                        }
                    }
                    if ((((Move) inst).getDst() instanceof VirtualRegister) && !(((Move) inst).getSrc() instanceof GlobalVariable)
                    && (((Move) inst).getSrc() instanceof VirtualRegister) && !(((Move) inst).getSrc() instanceof GlobalVariable))
                    {
                        live.removeAll(inst.used);
                        for (VirtualRegister def : inst.def)
                        {
                            def.moveList.add((Move) inst);
                        }
                        for (VirtualRegister use : inst.used)
                        {
                            use.moveList.add((Move) inst);
                        }
                        workListMoves.add((Move) inst);
                    }
                }
                live.addAll(inst.def);
                for (VirtualRegister def : inst.def)
                {
                    for (VirtualRegister l : live)
                    {
                        addEdge(def, l);
                    }
                }
                live.removeAll(inst.def);
                live.addAll(inst.used);
            }
        }
    }

    private void addEdge(VirtualRegister u, VirtualRegister v)
    {
        if (u != v && !(adjSet.contains(new Edge(u, v))))
        {
            adjSet.add(new Edge(u, v));
            adjSet.add(new Edge(v, u));
            if (!preColored.contains(u))
            {
                u.adjList.add(v);
                u.degree++;
            }
            if (!preColored.contains(v))
            {
                v.adjList.add(u);
                v.degree++;
            }
        }
    }

    private void makeWorkList()
    {
        for (VirtualRegister n : initial)
        {
            initial.remove(n);
            if (n.degree >= K)
            {
                spillWorkList.add(n);
            } else if (moveRelated(n))
            {
                freezeWorkList.add(n);
            } else
            {
                simplifyWorkList.add(n);
            }
        }
    }

    private boolean moveRelated(VirtualRegister n)
    {
        return !nodeMoves(n).isEmpty();
    }

    private Set<Move> nodeMoves(VirtualRegister n) {
        Set<Move> tmpActiveMoves = new HashSet<>(activeMoves);
        tmpActiveMoves.addAll(workListMoves);
        Set<Move> tmpMoveList = new HashSet<>(n.moveList);
        tmpMoveList.retainAll(tmpActiveMoves);
        return tmpMoveList;
    }

    private Set<VirtualRegister> adjacent(VirtualRegister n)
    {
        Set<VirtualRegister> tmp = new HashSet<>(n.adjList);
        tmp.removeAll(selectStack);
        tmp.removeAll(coalescedNodes);
        return tmp;
    }

    private void Simplify()
    {
        VirtualRegister n = simplifyWorkList.iterator().next();
        simplifyWorkList.remove(n);
        selectStack.push(n);
        for (VirtualRegister m : adjacent(n))
            decrementDegree(m);
    }

    private void decrementDegree(VirtualRegister m)
    {
        int d = m.degree;
        m.degree = d - 1;
        if (d == K)
        {
            Set<VirtualRegister> tmp = new HashSet<>(adjacent(m));
            tmp.add(m);
            enableMoves(tmp);
            spillWorkList.remove(m);
            if (moveRelated(m))
            {
                freezeWorkList.add(m);
            } else
            {
                simplifyWorkList.add(m);
            }
        }
    }

    private void enableMoves(Set<VirtualRegister> nodes)
    {
        for (VirtualRegister n : nodes)
            for (Move m : nodeMoves(n))
                if (activeMoves.contains(m))
                {
                    activeMoves.remove(m);
                    workListMoves.add(m);
                }
    }

    private void addWorkList(VirtualRegister u)
    {
        if ((!preColored.contains(u)) && (!moveRelated(u)) && u.degree < K)
        {
            freezeWorkList.remove(u);
            simplifyWorkList.add(u);
        }
    }

    private boolean OK(VirtualRegister t, VirtualRegister r)
    {
        return t.degree < K || preColored.contains(t) || adjSet.contains(new Edge(t, r));
    }

    private boolean conservative(Set<VirtualRegister> nodes)
    {
        int k = 0;
        for (VirtualRegister n : nodes)
        {
            if (n.degree >= K) k++;
        }
        return k < K;
    }

    private void Coalesce()
    {
    }

    private void Freeze()
    {
    }

    private void SelectSpill()
    {
    }

    private void assignColors()
    {
    }

    private void rewriteProgram(Function function)
    {
    }
}
