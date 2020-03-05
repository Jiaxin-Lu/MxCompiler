grammar Mx;

@header { package Compiler.Parser; }

program
    : programDecl*
    ;

programDecl
    : functionDecl | classDecl | variableDecl
    ;

// Decl

variableDecl
    : type variableList ';'
    ;

functionDecl
    : withVoidType Identifier '(' parameterList? ')' block
    ;

classDecl
    : Class Identifier '{' (variableDecl | constructorDecl | functionDecl)* '}' ';'
    ;

constructorDecl
    : Identifier '(' parameterList? ')' block
    ;

type
    : type '[' ']'      #ArrayType
    | nonArraytype      #nArrayType
    ;

nonArraytype
    : Int               #nArrayTypeInt
    | Bool              #nArrayTypeBool
    | String            #nArrayTypeString
    | Identifier        #nArrayTypeId
    ;

withVoidType
    : type
    | Void
    ;

variableList
    : variableSingle (',' variableSingle)*
    ;

variableSingle
    : Identifier ('=' expression)?
    ;

parameterList
    : parameter (',' parameter)*
    ;

parameter
    : type Identifier
    ;

// Statement

block
    : '{' statement* '}'
    ;

statement
    : block                     #blockStmt
    | variableDecl              #variableDeclStmt
    | expression ';'            #expressionStmt
    | conditionalStatement      #conditionalStmt
    | jumpStatement             #jumpStmt
    | loopStatement             #loopStmt
    | ';'                       #blankStmt
    ;

conditionalStatement
    : If '(' expression ')' thenStatement = statement (Else elseStatement = statement)?     #ifStmt
    ;

jumpStatement
    : Return expression? ';'    #returnStmt
    | Break ';'                 #breakStmt
    | Continue ';'              #continueStmt
    ;

loopStatement
    : While '(' expression ')' statement    #whileStmt
    | For '(' init = expression? ';' cond =  expression? ';' step = expression? ')' statement       #forStmt
    ;

// Expression

expression
    : expression '(' expressionList? ')'                            #FunctionCallExpr
    | expression '.' Identifier                                     #MemberExpr
    | array = expression '[' sub = expression ']'                   #ArrayExpr

    | <assoc = right> New creator                                   #newExpr
    | expression op = ('++' | '--')                                 #PostFixExpr
    | <assoc = right> op = ('++' | '--') expression                 #UnaryExpr
    | <assoc = right> op = ('!' | '~') expression                   #UnaryExpr
    | <assoc = right> op = ('+' | '-') expression                   #UnaryExpr

    | lhs = expression op = ('*' | '/' | '%') rhs = expression      #BinaryExpr
    | lhs = expression op = ('+' | '-') rhs = expression            #BinaryExpr
    | lhs = expression op = ('<<' | '>>') rhs = expression          #BinaryExpr
    | lhs = expression op = ('<=' | '>=') rhs = expression          #BinaryExpr
    | lhs = expression op = ('<' | '>') rhs = expression            #BinaryExpr
    | lhs = expression op = ('==' | '!=') rhs = expression          #BinaryExpr
    | lhs = expression op = '&' rhs = expression                    #BinaryExpr
    | lhs = expression op = '^' rhs = expression                    #BinaryExpr
    | lhs = expression op = '|' rhs = expression                    #BinaryExpr
    | lhs = expression op = '&&' rhs = expression                   #BinaryExpr
    | lhs = expression op = '||' rhs = expression                   #BinaryExpr

    | <assoc = right> lhs = expression '=' rhs = expression          #AssignExpr

    | Identifier                                                    #idExpr
    | This                                                          #thisExpr
    | constant                                                      #constExpr
    | '(' expression ')'                                            #subExpr
    ;

expressionList
    : expression (',' expression)*
    ;

creator
    : nonArraytype ('[' expression ']')+ ('[' ']')+ ('[' expression ']')+   #errorCreator
    | nonArraytype ('[' expression ']')+ ('[' ']')*     #arrayCreator
    | nonArraytype '(' ')'                              #classCreator
    | nonArraytype                                      #nArrayCreator
    ;

constant
    : IntegerConst          #intConst
    | BoolConst             #boolConst
    | StringConst           #strConst
    | NullLiteral           #nullConst
    ;

// Lexer

Bool : 'bool';
Int : 'int';
String : 'string';
Void : 'void';
fragment Null : 'null';
fragment True : 'true';
fragment False : 'false';
If : 'if';
Else : 'else';
For : 'for';
While : 'while';
Break : 'break';
Continue : 'continue';
Return : 'return';
New : 'new';
Class : 'class';
This : 'this';
Lbracket: '[';
Rbracket: ']';

IntegerConst
    : [0-9]+
    ;

StringConst
    :   '"' ('\\n' | '\\\\' | '\\"' | .)*? '"' 
    ;

BoolConst
    : True
    | False
    ;

NullLiteral
    : Null
    ;

Identifier
    : [a-zA-Z] + [a-zA-Z_0-9]*
    ;

WhiteSpace
    : [ \t\n\r]+ -> skip
    ;

LineComment
    :   '//' ~[\r\n]* -> skip
    ;

BlockComment
    :   '/*' .*? '*/' -> skip
    ;