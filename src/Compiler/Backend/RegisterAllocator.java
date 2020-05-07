package Compiler.Backend;

import Compiler.RISCV.RVBasicBlock;
import Compiler.RISCV.RVFunction;
import Compiler.RISCV.RVInstruction.Move;
import Compiler.RISCV.RVInstruction.RVInstruction;
import Compiler.RISCV.RVOperand.PhysicalRegister;
import Compiler.RISCV.RVOperand.RVRegister;
import Compiler.RISCV.RVRoot;

import java.util.*;

import static Compiler.RISCV.RVOperand.PhysicalRegister.*;

public class RegisterAllocator
{
    private static class Edge
    {
        RVRegister u, v;
        public Edge(RVRegister u, RVRegister v)
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

    private static final int K = allocatableRegisters.size();

    private RVRoot rvRoot;

    private Set<RVRegister> preColored = new HashSet<>();
    private Set<RVRegister> initial = new HashSet<>();
    private Set<RVRegister> simplifyWorkList = new HashSet<>();
    private Set<RVRegister> freezeWorkList = new HashSet<>();
    private Set<RVRegister> spillWorkList = new HashSet<>();
    private Set<RVRegister> spilledNodes = new HashSet<>();
    private Set<RVRegister> coalescedNodes = new HashSet<>();
    private Set<RVRegister> coloredNodes = new HashSet<>();

    private Stack<RVRegister> selectStack = new Stack<>();

    private Set<PhysicalRegister> colors = new HashSet<>();

    private Set<Move> workListMoves = new HashSet<>();
    private Set<Move> activeMoves = new HashSet<>();
    private Set<Move> coalescedMoves = new HashSet<>();
    private Set<Move> constrainedMoves = new HashSet<>();
    private Set<Move> frozenMoves = new HashSet<>();

    private Set<Edge> adjSet = new HashSet<>();

    public RegisterAllocator(RVRoot rvRoot)
    {
        this.rvRoot = rvRoot;
        preColored.addAll(allVirtualRegisters.values());
        colors.addAll(allocatableRegisters.values());
    }

    public void run()
    {
        for (RVFunction function : rvRoot.getFunctionMap().values())
        {
            allocate(function);
        }
    }

    private void init()
    {
        initial.clear();
        simplifyWorkList.clear();
        freezeWorkList.clear();
        spillWorkList.clear();
        spilledNodes.clear();
        coalescedNodes.clear();
        coloredNodes.clear();
        selectStack.clear();

        workListMoves.clear();
        activeMoves.clear();
        coalescedMoves.clear();
        constrainedMoves.clear();
        frozenMoves.clear();

        adjSet.clear();
    }

    public void allocate(RVFunction function)
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

    private void build(RVFunction function)
    {
        for (RVBasicBlock basicBlock : function.getPreOrderBlockList())
            for (RVInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
            {
                initial.addAll(inst.def);
                initial.addAll(inst.used);
            }
        initial.removeAll(preColored);
        for (RVRegister virtualRegister : initial)
        {
            virtualRegister.clearAllocInfo();
            virtualRegister.degree = 0;
            virtualRegister.color = null;
        }
        for (RVRegister virtualRegister : preColored)
        {
            virtualRegister.clearAllocInfo();
            virtualRegister.degree = 0x3f3f3f3f;
        }
        for (RVBasicBlock basicBlock : function.getPreOrderBlockList())
        {
            Set<RVRegister> live = new HashSet<>(basicBlock.liveOut);
            for (RVInstruction inst = basicBlock.tailInst; inst != null; inst = inst.getPrevInst())
            {
                if (inst instanceof Move)
                {
                    live.removeAll(inst.used);
                    for (RVRegister reg : inst.used)
                    {
                        reg.moveList.add((Move) inst);
                    }
                    for (RVRegister reg : inst.def)
                    {
                        reg.moveList.add((Move) inst);
                    }
                    workListMoves.add((Move) inst);
                }
                live.addAll(inst.def);
                // TODO : should we add zero?
                for (RVRegister def : inst.def)
                {
                    for (RVRegister l : live)
                    {
                        addEdge(def, l);
                    }
                }
                live.removeAll(inst.def);
                live.addAll(inst.used);
            }
        }
    }

    private void addEdge(RVRegister u, RVRegister v)
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
        for (RVRegister n : initial)
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

    private boolean moveRelated(RVRegister n)
    {
        return !nodeMoves(n).isEmpty();
    }

    private Set<Move> nodeMoves(RVRegister n) {
        Set<Move> tmpActiveMoves = new HashSet<>(activeMoves);
        tmpActiveMoves.addAll(workListMoves);
        Set<Move> tmpMoveList = new HashSet<>(n.moveList);
        tmpMoveList.retainAll(tmpActiveMoves);
        return tmpMoveList;
    }

    private Set<RVRegister> adjacent(RVRegister n)
    {
        Set<RVRegister> tmp = new HashSet<>(n.adjList);
        tmp.removeAll(selectStack);
        tmp.removeAll(coalescedNodes);
        return tmp;
    }

    private void Simplify()
    {
        RVRegister n = simplifyWorkList.iterator().next();
        simplifyWorkList.remove(n);
        selectStack.push(n);
        for (RVRegister m : adjacent(n))
            decrementDegree(m);
    }

    private void decrementDegree(RVRegister m)
    {
        int d = m.degree;
        m.degree = d - 1;
        if (d == K)
        {
            Set<RVRegister> tmp = new HashSet<>(adjacent(m));
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

    private void enableMoves(Set<RVRegister> nodes)
    {
        for (RVRegister n : nodes)
            for (Move m : nodeMoves(n))
                if (activeMoves.contains(m))
                {
                    activeMoves.remove(m);
                    workListMoves.add(m);
                }
    }

    private void addWorkList(RVRegister u)
    {
        if ((!preColored.contains(u)) && (!moveRelated(u)) && u.degree < K)
        {
            freezeWorkList.remove(u);
            simplifyWorkList.add(u);
        }
    }

    private boolean OK(RVRegister t, RVRegister r)
    {
        return t.degree < K || preColored.contains(t) || adjSet.contains(new Edge(t, r));
    }

    private boolean conservative(Set<RVRegister> nodes)
    {
        int k = 0;
        for (RVRegister n : nodes)
        {
            if (n.degree >= K) k++;
        }
        return k < K;
    }

    private void Coalesce()
    {
        Move m = workListMoves.iterator().next();
        RVRegister x = getAlias(m.getDst());
        RVRegister y = getAlias(m.getSrc());
        RVRegister u, v;
        if (preColored.contains(y))
        {
            u = y;
            v = x;
        } else
        {
            u = x;
            v = y;
        }
        workListMoves.remove(m);
        if (u == v)
        {
            coalescedMoves.add(m);
            addWorkList(u);
        } else if (preColored.contains(v) || adjSet.contains(new Edge(u, v)))
        {
            constrainedMoves.add(m);
            addWorkList(u);
            addWorkList(v);
        } else
        {
            boolean cond1 = preColored.contains(u);
            for (RVRegister t : adjacent(v))
            {
                cond1 &= OK(t, u);
            }
            boolean cond2 = !preColored.contains(u);
            Set<RVRegister> tmpSet = adjacent(u);
            tmpSet.addAll(adjacent(v));
            cond2 &= conservative(tmpSet);
            if (cond1 || cond2)
            {
                coalescedMoves.add(m);
                combine(u, v);
                addWorkList(u);
            } else
                activeMoves.add(m);
        }
    }

    private void combine(RVRegister u, RVRegister v)
    {
        if (freezeWorkList.contains(v))
            freezeWorkList.remove(v);
        else spillWorkList.remove(v);
        coalescedNodes.add(v);
        v.alias = u;
        u.moveList.addAll(v.moveList);
        Set<RVRegister> tmpSet = new HashSet<>();
        tmpSet.add(v);
        enableMoves(tmpSet);
        for (RVRegister t : adjacent(v))
        {
            addEdge(t, u);
            decrementDegree(t);
        }
        if (u.degree >= K  && freezeWorkList.contains(u))
        {
            freezeWorkList.remove(u);
            spillWorkList.add(u);
        }
    }

    private RVRegister getAlias(RVRegister n)
    {
        if (coalescedNodes.contains(n))
            return n.alias = getAlias(n.alias);
        else return n.alias;
    }

    private void Freeze()
    {
        RVRegister u = freezeWorkList.iterator().next();
        freezeWorkList.remove(u);
        simplifyWorkList.add(u);
        freezeMoves(u);
    }

    private void freezeMoves(RVRegister u)
    {
        for (Move m : nodeMoves(u))
        {
            RVRegister x = m.getDst();
            RVRegister y = m.getSrc();
            RVRegister v = getAlias(y) == getAlias(u) ? getAlias(x) : getAlias(y);
            activeMoves.remove(m);
            frozenMoves.add(m);
            if (freezeWorkList.contains(v) && nodeMoves(v).isEmpty())
            {
                freezeWorkList.remove(v);
                simplifyWorkList.add(v);
            }
        }
    }

    private void SelectSpill()
    {
        Iterator<RVRegister> iterator = spillWorkList.iterator();
        RVRegister m = iterator.next();
        while (m.addSpill && iterator.hasNext()) m = iterator.next();
        iterator = spillWorkList.iterator();
        RVRegister reg;
        while (iterator.hasNext())
        {
            reg = iterator.next();
            if (!reg.addSpill && reg.spillPriority < m.spillPriority)
                m = reg;
        }

        spillWorkList.remove(m);
        simplifyWorkList.add(m);
        freezeMoves(m);
    }

    private void assignColors()
    {
        while (!selectStack.isEmpty())
        {
            RVRegister n = selectStack.pop();
            Set<PhysicalRegister> okColors = new HashSet<>(colors);
            for (RVRegister w : n.adjList)
            {
                RVRegister wA = getAlias(w);
                if (coloredNodes.contains(wA) || preColored.contains(wA))
                    okColors.remove(wA.color);
            }
            if (okColors.isEmpty())
                spilledNodes.add(n);
            else
            {
                coloredNodes.add(n);
                //first select callee save
                PhysicalRegister color1 = okColors.iterator().next();
                okColors.retainAll(calleeSaveRegisters.values());
                PhysicalRegister color2 = null;
                if (!okColors.isEmpty()) color2 = okColors.iterator().next();
                n.color = color2 == null ? color1 : color2;
            }
        }
        for (RVRegister n : coalescedNodes)
        {
            n.color = getAlias(n).color;
        }
    }

    private void rewriteProgram(RVFunction function)
    {
        //TODO
//        for (RVRegister v : spilledNodes)
//        {
//            v.spillAddr = new StackData(vrbp, null,
//                    new Immediate(0), new Immediate(-(++function.spillCnt)*8));
//        }
//        for (RVRegister v : coalescedNodes)
//        {
//            getAlias(v);
//        }
//        for (RVBasicBlock basicBlock : function.getPreOrderBlockList())
//        {
//            for (RVInstruction inst = basicBlock.headInst; inst != null; inst = inst.getNextInst())
//            {
//                for (RVRegister use : inst.used)
//                    if (use.spillAddr != null)
//                    {
//                        if (inst.def.contains(use))
//                        {
//                            Value tmp = new Value("_spill_");
//                            tmp.addSpill = true;
//                            inst.addPrevInst(new Load(basicBlock, use.spillAddr, tmp));
//                            inst.addNextInst(new Store(basicBlock, tmp, use.spillAddr));
//                            inst.replaceUsed(use, tmp);
//                            inst.replaceDef(use, tmp);
//                        } else if (inst instanceof Move &&
//                                ((Move) inst).getSrc() == use &&
//                                ((RVRegister) ((Move) inst).getDst()).spillAddr == null)
//                        {
//                            inst.replaceInst(new Load(basicBlock, use.spillAddr, ((Move) inst).getDst()));
//                        } else
//                        {
//                            Value tmp = new Value("_spill_");
//                            tmp.addSpill = true;
//                            inst.addPrevInst(new Load(basicBlock, use.spillAddr, tmp));
//                            inst.replaceUsed(use, tmp);
//                        }
//                    }
//                for (RVRegister def : inst.def)
//                    if (inst.used.contains(def))
//                    {
//                        if (inst instanceof Move)
//                        {
//                            if (((Move) inst).getSrc() instanceof RVRegister &&
//                            ((RVRegister) ((Move) inst).getSrc()).spillAddr == null)
//                            {
//                                inst.replaceInst(new Store(basicBlock, ((Move) inst).getSrc(), def.spillAddr));
//                                continue;
//                            }
//                        }
//                        Value tmp = new Value("_spill_");
//                        tmp.addSpill = true;
//                        inst.addNextInst(new Store(basicBlock, tmp, def.spillAddr));
//                        inst.replaceDef(def, tmp);
//                    }
//                inst.calcDefUse();
//            }
//        }
    }
}
