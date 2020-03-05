// Generated from Mx.g4 by ANTLR 4.8
 package Compiler.Parser; 
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link MxParser}.
 */
public interface MxListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link MxParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(MxParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(MxParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#programDecl}.
	 * @param ctx the parse tree
	 */
	void enterProgramDecl(MxParser.ProgramDeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#programDecl}.
	 * @param ctx the parse tree
	 */
	void exitProgramDecl(MxParser.ProgramDeclContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#variableDecl}.
	 * @param ctx the parse tree
	 */
	void enterVariableDecl(MxParser.VariableDeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#variableDecl}.
	 * @param ctx the parse tree
	 */
	void exitVariableDecl(MxParser.VariableDeclContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#functionDecl}.
	 * @param ctx the parse tree
	 */
	void enterFunctionDecl(MxParser.FunctionDeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#functionDecl}.
	 * @param ctx the parse tree
	 */
	void exitFunctionDecl(MxParser.FunctionDeclContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#classDecl}.
	 * @param ctx the parse tree
	 */
	void enterClassDecl(MxParser.ClassDeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#classDecl}.
	 * @param ctx the parse tree
	 */
	void exitClassDecl(MxParser.ClassDeclContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#constructorDecl}.
	 * @param ctx the parse tree
	 */
	void enterConstructorDecl(MxParser.ConstructorDeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#constructorDecl}.
	 * @param ctx the parse tree
	 */
	void exitConstructorDecl(MxParser.ConstructorDeclContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ArrayType}
	 * labeled alternative in {@link MxParser#type}.
	 * @param ctx the parse tree
	 */
	void enterArrayType(MxParser.ArrayTypeContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ArrayType}
	 * labeled alternative in {@link MxParser#type}.
	 * @param ctx the parse tree
	 */
	void exitArrayType(MxParser.ArrayTypeContext ctx);
	/**
	 * Enter a parse tree produced by the {@code nArrayType}
	 * labeled alternative in {@link MxParser#type}.
	 * @param ctx the parse tree
	 */
	void enterNArrayType(MxParser.NArrayTypeContext ctx);
	/**
	 * Exit a parse tree produced by the {@code nArrayType}
	 * labeled alternative in {@link MxParser#type}.
	 * @param ctx the parse tree
	 */
	void exitNArrayType(MxParser.NArrayTypeContext ctx);
	/**
	 * Enter a parse tree produced by the {@code nArrayTypeInt}
	 * labeled alternative in {@link MxParser#nonArraytype}.
	 * @param ctx the parse tree
	 */
	void enterNArrayTypeInt(MxParser.NArrayTypeIntContext ctx);
	/**
	 * Exit a parse tree produced by the {@code nArrayTypeInt}
	 * labeled alternative in {@link MxParser#nonArraytype}.
	 * @param ctx the parse tree
	 */
	void exitNArrayTypeInt(MxParser.NArrayTypeIntContext ctx);
	/**
	 * Enter a parse tree produced by the {@code nArrayTypeBool}
	 * labeled alternative in {@link MxParser#nonArraytype}.
	 * @param ctx the parse tree
	 */
	void enterNArrayTypeBool(MxParser.NArrayTypeBoolContext ctx);
	/**
	 * Exit a parse tree produced by the {@code nArrayTypeBool}
	 * labeled alternative in {@link MxParser#nonArraytype}.
	 * @param ctx the parse tree
	 */
	void exitNArrayTypeBool(MxParser.NArrayTypeBoolContext ctx);
	/**
	 * Enter a parse tree produced by the {@code nArrayTypeString}
	 * labeled alternative in {@link MxParser#nonArraytype}.
	 * @param ctx the parse tree
	 */
	void enterNArrayTypeString(MxParser.NArrayTypeStringContext ctx);
	/**
	 * Exit a parse tree produced by the {@code nArrayTypeString}
	 * labeled alternative in {@link MxParser#nonArraytype}.
	 * @param ctx the parse tree
	 */
	void exitNArrayTypeString(MxParser.NArrayTypeStringContext ctx);
	/**
	 * Enter a parse tree produced by the {@code nArrayTypeId}
	 * labeled alternative in {@link MxParser#nonArraytype}.
	 * @param ctx the parse tree
	 */
	void enterNArrayTypeId(MxParser.NArrayTypeIdContext ctx);
	/**
	 * Exit a parse tree produced by the {@code nArrayTypeId}
	 * labeled alternative in {@link MxParser#nonArraytype}.
	 * @param ctx the parse tree
	 */
	void exitNArrayTypeId(MxParser.NArrayTypeIdContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#withVoidType}.
	 * @param ctx the parse tree
	 */
	void enterWithVoidType(MxParser.WithVoidTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#withVoidType}.
	 * @param ctx the parse tree
	 */
	void exitWithVoidType(MxParser.WithVoidTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#variableList}.
	 * @param ctx the parse tree
	 */
	void enterVariableList(MxParser.VariableListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#variableList}.
	 * @param ctx the parse tree
	 */
	void exitVariableList(MxParser.VariableListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#variableSingle}.
	 * @param ctx the parse tree
	 */
	void enterVariableSingle(MxParser.VariableSingleContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#variableSingle}.
	 * @param ctx the parse tree
	 */
	void exitVariableSingle(MxParser.VariableSingleContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#parameterList}.
	 * @param ctx the parse tree
	 */
	void enterParameterList(MxParser.ParameterListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#parameterList}.
	 * @param ctx the parse tree
	 */
	void exitParameterList(MxParser.ParameterListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#parameter}.
	 * @param ctx the parse tree
	 */
	void enterParameter(MxParser.ParameterContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#parameter}.
	 * @param ctx the parse tree
	 */
	void exitParameter(MxParser.ParameterContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#block}.
	 * @param ctx the parse tree
	 */
	void enterBlock(MxParser.BlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#block}.
	 * @param ctx the parse tree
	 */
	void exitBlock(MxParser.BlockContext ctx);
	/**
	 * Enter a parse tree produced by the {@code blockStmt}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterBlockStmt(MxParser.BlockStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code blockStmt}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitBlockStmt(MxParser.BlockStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code variableDeclStmt}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterVariableDeclStmt(MxParser.VariableDeclStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code variableDeclStmt}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitVariableDeclStmt(MxParser.VariableDeclStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code expressionStmt}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterExpressionStmt(MxParser.ExpressionStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code expressionStmt}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitExpressionStmt(MxParser.ExpressionStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code conditionalStmt}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterConditionalStmt(MxParser.ConditionalStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code conditionalStmt}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitConditionalStmt(MxParser.ConditionalStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code jumpStmt}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterJumpStmt(MxParser.JumpStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code jumpStmt}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitJumpStmt(MxParser.JumpStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code loopStmt}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterLoopStmt(MxParser.LoopStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code loopStmt}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitLoopStmt(MxParser.LoopStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code blankStmt}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterBlankStmt(MxParser.BlankStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code blankStmt}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitBlankStmt(MxParser.BlankStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ifStmt}
	 * labeled alternative in {@link MxParser#conditionalStatement}.
	 * @param ctx the parse tree
	 */
	void enterIfStmt(MxParser.IfStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ifStmt}
	 * labeled alternative in {@link MxParser#conditionalStatement}.
	 * @param ctx the parse tree
	 */
	void exitIfStmt(MxParser.IfStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code returnStmt}
	 * labeled alternative in {@link MxParser#jumpStatement}.
	 * @param ctx the parse tree
	 */
	void enterReturnStmt(MxParser.ReturnStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code returnStmt}
	 * labeled alternative in {@link MxParser#jumpStatement}.
	 * @param ctx the parse tree
	 */
	void exitReturnStmt(MxParser.ReturnStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code breakStmt}
	 * labeled alternative in {@link MxParser#jumpStatement}.
	 * @param ctx the parse tree
	 */
	void enterBreakStmt(MxParser.BreakStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code breakStmt}
	 * labeled alternative in {@link MxParser#jumpStatement}.
	 * @param ctx the parse tree
	 */
	void exitBreakStmt(MxParser.BreakStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code continueStmt}
	 * labeled alternative in {@link MxParser#jumpStatement}.
	 * @param ctx the parse tree
	 */
	void enterContinueStmt(MxParser.ContinueStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code continueStmt}
	 * labeled alternative in {@link MxParser#jumpStatement}.
	 * @param ctx the parse tree
	 */
	void exitContinueStmt(MxParser.ContinueStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code whileStmt}
	 * labeled alternative in {@link MxParser#loopStatement}.
	 * @param ctx the parse tree
	 */
	void enterWhileStmt(MxParser.WhileStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code whileStmt}
	 * labeled alternative in {@link MxParser#loopStatement}.
	 * @param ctx the parse tree
	 */
	void exitWhileStmt(MxParser.WhileStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code forStmt}
	 * labeled alternative in {@link MxParser#loopStatement}.
	 * @param ctx the parse tree
	 */
	void enterForStmt(MxParser.ForStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code forStmt}
	 * labeled alternative in {@link MxParser#loopStatement}.
	 * @param ctx the parse tree
	 */
	void exitForStmt(MxParser.ForStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code newExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterNewExpr(MxParser.NewExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code newExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitNewExpr(MxParser.NewExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code thisExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterThisExpr(MxParser.ThisExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code thisExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitThisExpr(MxParser.ThisExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ArrayExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterArrayExpr(MxParser.ArrayExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ArrayExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitArrayExpr(MxParser.ArrayExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code FunctionCallExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterFunctionCallExpr(MxParser.FunctionCallExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code FunctionCallExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitFunctionCallExpr(MxParser.FunctionCallExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code MemberExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterMemberExpr(MxParser.MemberExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code MemberExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitMemberExpr(MxParser.MemberExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code BinaryExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterBinaryExpr(MxParser.BinaryExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code BinaryExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitBinaryExpr(MxParser.BinaryExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code PostFixExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterPostFixExpr(MxParser.PostFixExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code PostFixExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitPostFixExpr(MxParser.PostFixExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code subExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterSubExpr(MxParser.SubExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code subExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitSubExpr(MxParser.SubExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code UnaryExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterUnaryExpr(MxParser.UnaryExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code UnaryExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitUnaryExpr(MxParser.UnaryExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code idExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterIdExpr(MxParser.IdExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code idExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitIdExpr(MxParser.IdExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code constExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterConstExpr(MxParser.ConstExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code constExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitConstExpr(MxParser.ConstExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code AssignExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterAssignExpr(MxParser.AssignExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code AssignExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitAssignExpr(MxParser.AssignExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#expressionList}.
	 * @param ctx the parse tree
	 */
	void enterExpressionList(MxParser.ExpressionListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#expressionList}.
	 * @param ctx the parse tree
	 */
	void exitExpressionList(MxParser.ExpressionListContext ctx);
	/**
	 * Enter a parse tree produced by the {@code errorCreator}
	 * labeled alternative in {@link MxParser#creator}.
	 * @param ctx the parse tree
	 */
	void enterErrorCreator(MxParser.ErrorCreatorContext ctx);
	/**
	 * Exit a parse tree produced by the {@code errorCreator}
	 * labeled alternative in {@link MxParser#creator}.
	 * @param ctx the parse tree
	 */
	void exitErrorCreator(MxParser.ErrorCreatorContext ctx);
	/**
	 * Enter a parse tree produced by the {@code arrayCreator}
	 * labeled alternative in {@link MxParser#creator}.
	 * @param ctx the parse tree
	 */
	void enterArrayCreator(MxParser.ArrayCreatorContext ctx);
	/**
	 * Exit a parse tree produced by the {@code arrayCreator}
	 * labeled alternative in {@link MxParser#creator}.
	 * @param ctx the parse tree
	 */
	void exitArrayCreator(MxParser.ArrayCreatorContext ctx);
	/**
	 * Enter a parse tree produced by the {@code classCreator}
	 * labeled alternative in {@link MxParser#creator}.
	 * @param ctx the parse tree
	 */
	void enterClassCreator(MxParser.ClassCreatorContext ctx);
	/**
	 * Exit a parse tree produced by the {@code classCreator}
	 * labeled alternative in {@link MxParser#creator}.
	 * @param ctx the parse tree
	 */
	void exitClassCreator(MxParser.ClassCreatorContext ctx);
	/**
	 * Enter a parse tree produced by the {@code nArrayCreator}
	 * labeled alternative in {@link MxParser#creator}.
	 * @param ctx the parse tree
	 */
	void enterNArrayCreator(MxParser.NArrayCreatorContext ctx);
	/**
	 * Exit a parse tree produced by the {@code nArrayCreator}
	 * labeled alternative in {@link MxParser#creator}.
	 * @param ctx the parse tree
	 */
	void exitNArrayCreator(MxParser.NArrayCreatorContext ctx);
	/**
	 * Enter a parse tree produced by the {@code intConst}
	 * labeled alternative in {@link MxParser#constant}.
	 * @param ctx the parse tree
	 */
	void enterIntConst(MxParser.IntConstContext ctx);
	/**
	 * Exit a parse tree produced by the {@code intConst}
	 * labeled alternative in {@link MxParser#constant}.
	 * @param ctx the parse tree
	 */
	void exitIntConst(MxParser.IntConstContext ctx);
	/**
	 * Enter a parse tree produced by the {@code boolConst}
	 * labeled alternative in {@link MxParser#constant}.
	 * @param ctx the parse tree
	 */
	void enterBoolConst(MxParser.BoolConstContext ctx);
	/**
	 * Exit a parse tree produced by the {@code boolConst}
	 * labeled alternative in {@link MxParser#constant}.
	 * @param ctx the parse tree
	 */
	void exitBoolConst(MxParser.BoolConstContext ctx);
	/**
	 * Enter a parse tree produced by the {@code strConst}
	 * labeled alternative in {@link MxParser#constant}.
	 * @param ctx the parse tree
	 */
	void enterStrConst(MxParser.StrConstContext ctx);
	/**
	 * Exit a parse tree produced by the {@code strConst}
	 * labeled alternative in {@link MxParser#constant}.
	 * @param ctx the parse tree
	 */
	void exitStrConst(MxParser.StrConstContext ctx);
	/**
	 * Enter a parse tree produced by the {@code nullConst}
	 * labeled alternative in {@link MxParser#constant}.
	 * @param ctx the parse tree
	 */
	void enterNullConst(MxParser.NullConstContext ctx);
	/**
	 * Exit a parse tree produced by the {@code nullConst}
	 * labeled alternative in {@link MxParser#constant}.
	 * @param ctx the parse tree
	 */
	void exitNullConst(MxParser.NullConstContext ctx);
}