# MxCompiler


> Is this the end of all the endings.

This is the course project of MS208.

This compiler has already pass Baseline 2 (the strongest baseline in the course) and 
its performance is stronger than GCC O1. 

## Parser

Using ANTLR4 as parser.
 

## AST

The structure of AST can be found in the `Compiler.AST` package.

Build AST in `ASTBuilder.java`.

## Semantic Analysis

* Initialize global scope and add `_init_` function for global variable.
* Scan declaration of classes and functions.
* Scan declaration inside classes.
* Build the scope for blocks.
* More detailed semantic check for statements and expressions.

You can find all these in the `Compiler.Frontend` package.

## Intermediate Representation

I didn't use LLVM IR because I find its quite a waste.

### Components

Components of my IR is similar to the LLVM IR with `IRRoot`, `Function`, `BasicBlock`, and `IRInstruction`.

### IRInstruction

* [x] AllocInst
* [x] BinaryInst
* [x] UnaryInst
* [x] CmpInst
* [x] BranchInst
* [x] JumpInst
* [x] ReturnInst
* [x] CallInst
* [x] MoveInst
* [x] LoadInst
* [x] StoreInst
* [x] Phi (Only used in SSA)

You can understand each instruction by its name.

### Interpreter

I modified the interpreter written by abcdabcd987 to interpret my IR.

## Optimization

### CFG Simplification

On SSA, 

* remove BranchInst with same target block or with constant condition expression
* remove Phi with single path
* remove unreachable block

On non-SSA,

* remove BranchInst with same target block or with constant condition expression
* remove block with a single BranchInst
* remove unreachable block
* merge two blocks if they are each other's only predecessor and successor

### SSA Constructor & Destructor

For SSA constructor, I implemented the algorithm in `Engineering a Compiler` Chapter 9.3.

For SSA destructor, I tried to implement the parallel copy sequentialization algorithm
 in [Revisiting Out-of-SSA Translation for Correctness, Code
     Quality, and Efficiency](https://hal.inria.fr/inria-00349925v1/document), but it didn't work as
 it should be so there might be some bugs I should fix.
 
### Dominator Tree Constructor

I implemented the algorithm in [A Simple, Fast Dominance Algorithm](https://www.cs.rice.edu/~keith/EMBED/dom.pdf).

This implementation is fast and easy but might have some problem that the dead loops in
 the original code will cause dead loop in this algorithm. This could be avoided by adding
 some analysis on the code structure but will make the algorithm less elegant.
 
### Dead Code Elimination

A very powerful optimization.

I implemented the algorithm in `Engineering a Compiler` Chapter 10.2.

The critical instruction I set is ReturnInst, CallInst, and StoreInst.  

### Sparse Conditional Constant Propagation

A very powerful optimization and very useful for arithmetic calculation with known numbers when compiling.

Actually, with SCCP and function inline, testcase `t28` (recursively calculate gcd of known numbers)
 could be optimized to 3 print calls. Also, some testcase in codegen could be highly optimized
 with the use of SCCP.

I referenced the algorithm in `Engineering a Compiler` Chapter 10.7.

Except for constant folding, I also did:

* fold string calls with constant string
* eliminate redundant move instructions (in my implementation, I can't fold the move instruction
 `dst = src` if `dst` is in the path of one phi instruction because the order of phi instruction
 is not that optimal).

### Function Inline

A very powerful optimization.

* For non-recursive inline, I'll check whether the its a recursive call and then compare the 
 number of instructions with the limit I set.
 
* For recursive inline, I'll compare the number of instructions with the limit I set and 
 check the depth of the recursive inline.
 
It might exceed the time limit if the size of instructions is too large. 

### Unused Function Eliminator

To eliminate the uncalled functions for better output.

### Loop Invariant Code Motion

To move the loop invariant out of the loop.

[This page](https://www.cs.cornell.edu/courses/cs6120/2019fa/blog/loop-reduction/) has some great examples
 on loop analysis and loop invariant code motion.

### Arithmetic Optimization

* Optimize multiplication with the form `a = mul b 2^n` to `a = shl b n`.
* Optimize add with the form `a = add b 0` to `a = mv b`.

### Common Sub-Expression Elimination

I implemented local common sub-expression elimination in this section. 
 It will optimize BinaryInst and CmpInst.

### Global Value Numbering
 
I implemented the global value numbering algorithm on [this page](https://www.cs.cornell.edu/courses/cs6120/2019fa/blog/global-value-numbering/).

This optimization works on my computer but didn't work on Online Judge. The problem 
 I found is that the simple instructions decreased, while the cache miss and
 mem operation increased when judging online (which is not the case on my computer).

### Other Small Optimization

#### Print relevant Optimization

* Optimize `print(toString(x))` / `println(toString(x))` to `printInt(x)` / `printlnInt(x)`
* Optimize `print(x + y)` / `println(x + y)` to `print(x); print(y);` / `print(x); println(y);`

#### Global Variable Localization

* Load the global variable used in a function when entering the function.
* Store the global variable used when exiting the function.
* Store the global variable before the call and load them after the call.
 (In my implementation, I only store and load the variable used in the callee function, 
 which is not optimal universally.)


## Backend

### RISC-V

A new instruction system to convert IR instructions to the RISC-V instructions.
 They could be found in `Compiler.RISCV` package.
 
For convenience of further implementation, I rewrote the components in IR to `RVBasicBlock`,
 `RVFunction`, `RVRoot`, but they are basically the same.
 
I altered the operand in IR to fit the requirement of RISC-V instructions.

### Register Allocation

Graph coloring in `Modern Compiler Implementation in Java (the tigger book)` Chapter 11.

Calculate spill priority with loop analysis.

### Peephole

* Remove redundant move with the same `dst` and `src`.
* Remove load after store.
