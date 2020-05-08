package Compiler.RISCV.RVOperand;

import java.util.*;

public class RVPhysicalRegister extends RVRegister
{
    public boolean isCallerSave = false;
    public boolean isCalleeSave = false;

    public RVPhysicalRegister() {}
    public RVPhysicalRegister(String name)
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

    public static final Map<String, RVPhysicalRegister> callerSaveRegisters = new LinkedHashMap<>();
    public static final Map<String, RVPhysicalRegister> calleeSaveRegisters = new LinkedHashMap<>();
    public static final Map<String, RVPhysicalRegister> argumentRegisters = new LinkedHashMap<>();
    public static final Map<String, RVPhysicalRegister> allocatableRegisters = new LinkedHashMap<>();
    public static final Map<String, RVPhysicalRegister> allRegisters = new LinkedHashMap<>();

    public static final Set<RVVirtualRegister> callerSaveVirtualRegisters = new HashSet<>();
    public static final Set<RVVirtualRegister> calleeSaveVirtualRegisters = new HashSet<>();
    public static final List<RVVirtualRegister> argumentVirtualRegisters = new LinkedList<>();
    public static final Map<String, RVVirtualRegister> allVirtualRegisters = new LinkedHashMap<>();

    public static final RVVirtualRegister vzero;
    public static final RVVirtualRegister vra;
    public static final RVPhysicalRegister hi = new RVPhysicalRegister("%hi");
    public static final RVPhysicalRegister lo = new RVPhysicalRegister("%lo");

    static
    {
        for (String name : physicalRegisterNames)
        {
            allRegisters.put(name, new RVPhysicalRegister(name));
            RVVirtualRegister RVVirtualRegister = new RVVirtualRegister("v" + name, allRegisters.get(name));
            allVirtualRegisters.put(name, RVVirtualRegister);
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
