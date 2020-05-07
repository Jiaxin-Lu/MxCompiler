package Compiler.RISCV.RVOperand;

import java.util.*;

public class PhysicalRegister extends RVRegister
{
    public boolean isCallerSave = false;
    public boolean isCalleeSave = false;

    public PhysicalRegister() {}
    public PhysicalRegister(String name)
    {
        super(name);
        this.color = this;
    }

    static public String[] physicalRegisterNames = {
            "zero", "ra", "sp", "gp", "tp",
            "t0", "t1", "t2", "s0", "s1",
            "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
            "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11",
            "t3", "t4", "t5", "t6"};
    static public String[] callerSaveRegisterNames = {
            "ra", "t0", "t1", "t2",
            "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
            "t3", "t4", "t5", "t6"
    };
    static public String[] calleeSaveRegisterNames = {
            "s0", "s1", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11"
    };
    static public String[] allocatableRegisterNames = {
            "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
            "s0", "s1", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11",
            "t0", "t1", "t2", "t3", "t4", "t5", "t6",
            "ra"
    };
    static public String[] argumentRegisterNames = {
            "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
    };

    public static final Map<String, PhysicalRegister> callerSaveRegisters = new LinkedHashMap<>();
    public static final Map<String, PhysicalRegister> calleeSaveRegisters = new LinkedHashMap<>();
    public static final Map<String, PhysicalRegister> argumentRegisters = new LinkedHashMap<>();
    public static final Map<String, PhysicalRegister> allocatableRegisters = new LinkedHashMap<>();
    public static final Map<String, PhysicalRegister> allRegisters = new LinkedHashMap<>();

    public static final Set<VirtualRegister> callerSaveVirtualRegisters = new HashSet<>();
    public static final Set<VirtualRegister> calleeSaveVirtualRegisters = new HashSet<>();
    public static final List<VirtualRegister> argumentVirtualRegisters = new LinkedList<>();
    public static final Map<String, VirtualRegister> allVirtualRegisters = new LinkedHashMap<>();

    public static final VirtualRegister vzero;
    public static final VirtualRegister vra;


    static
    {
        for (String name : physicalRegisterNames)
        {
            allRegisters.put(name, new PhysicalRegister(name));
            VirtualRegister virtualRegister = new VirtualRegister("v" + name, allRegisters.get(name));
            allVirtualRegisters.put(name, virtualRegister);
        }

        for (String name : calleeSaveRegisterNames)
        {
            allRegisters.get(name).isCalleeSave = true;
            calleeSaveRegisters.put(name, allRegisters.get(name));
            calleeSaveVirtualRegisters.add(allVirtualRegisters.get(name));
        }
        for (String name : callerSaveRegisterNames)
        {
            allRegisters.get(name).isCallerSave = true;
            callerSaveRegisters.put(name, allRegisters.get(name));
            callerSaveVirtualRegisters.add(allVirtualRegisters.get(name));
        }
        for (String name : allocatableRegisterNames)
        {
            allocatableRegisters.put(name, allRegisters.get(name));
        }
        for (String name : argumentRegisterNames)
        {
            argumentRegisters.put(name, allRegisters.get(name));
            argumentVirtualRegisters.add(allVirtualRegisters.get(name));
        }
        vzero = allVirtualRegisters.get("zero");
        vra = allVirtualRegisters.get("ra");
    }

    @Override
    public String toString()
    {
        return name;
    }
}
