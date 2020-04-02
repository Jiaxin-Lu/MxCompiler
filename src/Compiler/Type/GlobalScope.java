package Compiler.Type;

import Compiler.AST.*;
import Compiler.IR.IRRoot;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;
import com.sun.jdi.VoidType;

import java.security.PublicKey;
import java.util.LinkedHashMap;
import java.util.Map;

public class GlobalScope extends BaseScope
{
    private Map<String, Type> typeMap = new LinkedHashMap<>();
    private PrimitiveTypeSymbol IntTypeSymbol = new PrimitiveTypeSymbol("int");
    private PrimitiveTypeSymbol BoolTypeSymbol = new PrimitiveTypeSymbol("bool");
    private PrimitiveTypeSymbol VoidTypeSymbol = new PrimitiveTypeSymbol("void");
    private ClassSymbol string = new ClassSymbol("string", null, this);
    private FunctionSymbol arraySizeSymbol = new FunctionSymbol("array.size", IntTypeSymbol, null, this);

    public GlobalScope(String name)
    {
        super(name, null);
    }

    public void Initializer() throws SemanticError
    {
        definePrimitiveTypeSymbol(IntTypeSymbol);
        definePrimitiveTypeSymbol(BoolTypeSymbol);
        definePrimitiveTypeSymbol(VoidTypeSymbol);
        arraySizeSymbol.setMemberFunction();

        //string
        string.defineFunction(new FunctionSymbol("length", IntTypeSymbol,null, string));
        FunctionSymbol stringSubstring = new FunctionSymbol("substring", string, null, string);
        stringSubstring.defineVariable(new VariableSymbol("left", IntTypeSymbol, null));
        stringSubstring.defineVariable(new VariableSymbol("right", IntTypeSymbol, null));
        string.defineFunction(stringSubstring);
        string.defineFunction(new FunctionSymbol("parseInt", IntTypeSymbol, null, string));
        FunctionSymbol stringOrd = new FunctionSymbol("ord", IntTypeSymbol, null, string);
        stringOrd.defineVariable(new VariableSymbol("i", IntTypeSymbol, null));
        string.defineFunction(stringOrd);
        defineClass(string);

        //function
        FunctionSymbol globalPrint = new FunctionSymbol("print", VoidTypeSymbol, null, this);
        globalPrint.defineVariable(new VariableSymbol("str", string ,null));
        defineFunction(globalPrint);

        FunctionSymbol globalPrintln = new FunctionSymbol("println", VoidTypeSymbol, null, this);
        globalPrintln.defineVariable(new VariableSymbol("str", string ,null));
        defineFunction(globalPrintln);

        FunctionSymbol globalPrintInt = new FunctionSymbol("printInt", VoidTypeSymbol, null, this);
        globalPrintInt.defineVariable(new VariableSymbol("i", IntTypeSymbol, null));
        defineFunction(globalPrintInt);

        FunctionSymbol globalPrintlnInt = new FunctionSymbol("printlnInt", VoidTypeSymbol, null, this);
        globalPrintlnInt.defineVariable(new VariableSymbol("i", IntTypeSymbol, null));
        defineFunction(globalPrintlnInt);

        defineFunction(new FunctionSymbol("getString", string, null, this));
        defineFunction(new FunctionSymbol("getInt", IntTypeSymbol, null, this));

        FunctionSymbol globalToString = new FunctionSymbol("toString", string, null, this);
        globalToString.defineVariable(new VariableSymbol("i", IntTypeSymbol, null));
        defineFunction(globalToString);
    }

    public void IRInitializer(IRRoot irRoot) throws SemanticError
    {
        //string
        ((FunctionSymbol) this.getString().resolveSymbol(null,"length")).setFunction(irRoot.builtinStringLength);
        ((FunctionSymbol) this.getString().resolveSymbol(null,"substring")).setFunction(irRoot.builtinStringSubstring);
        ((FunctionSymbol) this.getString().resolveSymbol(null,"parseInt")).setFunction(irRoot.builtinStringParseInt);
        ((FunctionSymbol) this.getString().resolveSymbol(null,"ord")).setFunction(irRoot.builtinStringOrd);

        //function
        ((FunctionSymbol) this.resolveSymbol(null, "print")).setFunction(irRoot.builtinPrint);
        ((FunctionSymbol) this.resolveSymbol(null, "println")).setFunction(irRoot.builtinPrintln);
        ((FunctionSymbol) this.resolveSymbol(null, "printInt")).setFunction(irRoot.builtinPrintInt);
        ((FunctionSymbol) this.resolveSymbol(null, "printlnInt")).setFunction(irRoot.builtinPrintlnInt);
        ((FunctionSymbol) this.resolveSymbol(null, "getString")).setFunction(irRoot.builtinGetString);
        ((FunctionSymbol) this.resolveSymbol(null, "getInt")).setFunction(irRoot.builtinGetInt);
        ((FunctionSymbol) this.resolveSymbol(null, "toString")).setFunction(irRoot.builtinToString);
    }

    public Type getTypeForTypeNode(TypeNode typeNode) throws SemanticError
    {
        Type type = resolveTypeNode(typeNode);
        if (typeNode instanceof ArrayTypeNode)
        {
            return new ArraySymbol(type, ((ArrayTypeNode)typeNode).getDims());
        } else return type;
    }

    //Primitive Type Symbol
    public void definePrimitiveTypeSymbol(PrimitiveTypeSymbol obj)
    {
        typeMap.put(obj.getName(), obj);
        obj.setScope(this);
    }

    public PrimitiveTypeSymbol getIntTypeSymbol()
    {
        return IntTypeSymbol;
    }

    public PrimitiveTypeSymbol getBoolTypeSymbol()
    {
        return BoolTypeSymbol;
    }

    public PrimitiveTypeSymbol getVoidTypeSymbol()
    {
        return VoidTypeSymbol;
    }

    //string
    public ClassSymbol getString()
    {
        return string;
    }

    //array.size
    public FunctionSymbol getArraySizeSymbol()
    {
        return arraySizeSymbol;
    }

    //Scope
    @Override
    public void defineClass(ClassSymbol obj) throws SemanticError
    {
        if (typeMap.containsKey(obj.getTypeName()))
            throw new SemanticError(obj.getOrigin().getPosition(), "Duplicated id!");
        if (symbolMap.containsKey(obj.getTypeName()))
            throw new SemanticError(obj.getOrigin().getPosition(), "Duplicated id!");
        symbolMap.put(obj.getTypeName(), obj);
        typeMap.put(obj.getTypeName(), obj);
        obj.setScope(this);
    }

    public void TypeConflict(Symbol obj) throws SemanticError
    {
        if (typeMap.containsKey(obj.getName()))
            throw new SemanticError(obj.getOrigin().getPosition(), "Conflict with known Type!");
    }

    @Override
    public Symbol resolveSymbol(Position position, String id) throws SemanticError
    {
        Symbol type = symbolMap.get(id);
//        System.out.println("now try to get id: " + id);
        if (type == null) throw new SemanticError(position, "Unknown id!");
        return type;
    }

    public Type resolveTypeNode(TypeNode typeNode) throws SemanticError
    {
        Type type = typeMap.get(typeNode.getTypeId());
        if (type == null) throw new SemanticError(typeNode.getPosition(), "Unknown type!");
        return type;
    }

    public Symbol resolveMain() throws SemanticError
    {
        if (!symbolMap.containsKey("main"))
            throw new SemanticError(new Position(0,0), "Can't find Main!");
        else return symbolMap.get("main");
//        Symbol type = symbolMap.get("main");
//        if (type != null) return type;
//        else throw new SemanticError(new Position(0,0), "Can't find Main!");
    }
}
