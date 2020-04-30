package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

public class PhysicalRegister extends Register
{
    public boolean isCallerSave;
    public boolean isCalleeSave;
    public boolean isGlobal;
    public String lowByteName;

    public PhysicalRegister() {}
    public PhysicalRegister(String name)
    {
        super(name);
    }
    public PhysicalRegister(String name, String lowByteName, boolean callerSave, boolean calleeSave, boolean isGlobal)
    {
        super(name);
        this.lowByteName = lowByteName;
        this.isCallerSave = callerSave;
        this.isCalleeSave = calleeSave;
        this.isGlobal = isGlobal;
    }

    public static final PhysicalRegister rax = new PhysicalRegister("rax", "al", true, false, false);
    public static final PhysicalRegister rcx = new PhysicalRegister("rcx", "cl", true, false, false);
    public static final PhysicalRegister rdx = new PhysicalRegister("rdx", "dl", true, false, false);
    public static final PhysicalRegister rbx = new PhysicalRegister("rbx", "bl", false, true, false);
    public static final PhysicalRegister rsi = new PhysicalRegister("rsi", "sil", true, false, false);
    public static final PhysicalRegister rdi = new PhysicalRegister("rdi", "dil", true, false, false);
    public static final PhysicalRegister rsp = new PhysicalRegister("rsp", "spl", true, false, false);
    public static final PhysicalRegister rbp = new PhysicalRegister("rbp", "bpl", false, true, false);
    public static final PhysicalRegister r8 = new PhysicalRegister("r8", "r8b", true, false, true);
    public static final PhysicalRegister r9 = new PhysicalRegister("r9", "r9b", true, false, true);
    public static final PhysicalRegister r10 = new PhysicalRegister("r10", "r10b", true, false, true);
    public static final PhysicalRegister r11 = new PhysicalRegister("r11", "r11b", true, false, true);
    public static final PhysicalRegister r12 = new PhysicalRegister("r12", "r12b", false, true, true);
    public static final PhysicalRegister r13 = new PhysicalRegister("r13", "r13b", false, true, true);
    public static final PhysicalRegister r14 = new PhysicalRegister("r14", "r14b", false, true, true);
    public static final PhysicalRegister r15 = new PhysicalRegister("r15", "r15b", false, true, true);

    public static final Set<PhysicalRegister> callerSaveRegisters = new HashSet<>();
    public static final Set<PhysicalRegister> calleeSaveRegisters = new HashSet<>();
    public static final List<PhysicalRegister> argumentRegisters = new LinkedList<>();
    public static final List<PhysicalRegister> allRegisters = new LinkedList<>();

    public static final VirtualRegister vrax = new VirtualRegister("vrax", rax);
    public static final VirtualRegister vrcx = new VirtualRegister("vrcx", rcx);
    public static final VirtualRegister vrdx = new VirtualRegister("vrdx", rdx);
    public static final VirtualRegister vrbx = new VirtualRegister("vrbx", rbx);
    public static final VirtualRegister vrsi = new VirtualRegister("vrsi", rsi);
    public static final VirtualRegister vrdi = new VirtualRegister("vrdi", rdi);
    public static final VirtualRegister vrsp = new VirtualRegister("vrsp", rsp);
    public static final VirtualRegister vrbp = new VirtualRegister("vrbp", rbp);
    public static final VirtualRegister vr8 = new VirtualRegister("vr8", r8);
    public static final VirtualRegister vr9 = new VirtualRegister("vr9", r9);
    public static final VirtualRegister vr10 = new VirtualRegister("vr10", r10);
    public static final VirtualRegister vr11 = new VirtualRegister("vr11", r11);
    public static final VirtualRegister vr12 = new VirtualRegister("vr12", r12);
    public static final VirtualRegister vr13 = new VirtualRegister("vr13", r13);
    public static final VirtualRegister vr14 = new VirtualRegister("vr14", r14);
    public static final VirtualRegister vr15 = new VirtualRegister("vr15", r15);

    public static final Set<VirtualRegister> callerSaveVirtualRegisters = new HashSet<>();
    public static final Set<VirtualRegister> calleeSaveVirtualRegisters = new HashSet<>();
    public static final List<VirtualRegister> argumentVirtualRegisters = new LinkedList<>();
    public static final List<VirtualRegister> allVirtualRegisters = new LinkedList<>();

    static
    {
        argumentVirtualRegisters.add(vrdi);
        argumentVirtualRegisters.add(vrsi);
        argumentVirtualRegisters.add(vrdx);
        argumentVirtualRegisters.add(vrcx);
        argumentVirtualRegisters.add(vr8);
        argumentVirtualRegisters.add(vr9);
        for (VirtualRegister reg : argumentVirtualRegisters)
        {
            argumentRegisters.add(reg.color);
        }
        allVirtualRegisters.add(vrax);
        allVirtualRegisters.add(vrcx);
        allVirtualRegisters.add(vrdx);
        allVirtualRegisters.add(vrbx);
        allVirtualRegisters.add(vrsi);
        allVirtualRegisters.add(vrdi);
        allVirtualRegisters.add(vrsp);
        allVirtualRegisters.add(vrbp);
        allVirtualRegisters.add(vr8);
        allVirtualRegisters.add(vr9);
        allVirtualRegisters.add(vr10);
        allVirtualRegisters.add(vr11);
        allVirtualRegisters.add(vr12);
        allVirtualRegisters.add(vr13);
        allVirtualRegisters.add(vr14);
        allVirtualRegisters.add(vr15);
        for (VirtualRegister reg : allVirtualRegisters)
        {
            allRegisters.add(reg.color);
            if (reg.color.isCallerSave)
            {
                callerSaveVirtualRegisters.add(reg);
                callerSaveRegisters.add(reg.color);
            } else
            {
                calleeSaveVirtualRegisters.add(reg);
                calleeSaveRegisters.add(reg.color);
            }
        }
    }

    @Override
    public void accept(IRVisitor visitor)
    {
        visitor.visit(this);
    }
}
