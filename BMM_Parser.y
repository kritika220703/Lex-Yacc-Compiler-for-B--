%{
    # include <stdio.h>
    # include <stdlib.h>
    # include <string.h>
    # include <math.h>
    int yylex(void);
    int yyparse();
    void yyerror(char const *s);
    int counter=0,for_counter=0;
    extern FILE *yyin;
    
%}

%start PROG_STMT

%token INT SINGLE_PRECISION EOL TERM DOUBLE_PRECISION NUMBER DECIMAL DECIMAL_DOUBLE DECIMAL_SINGLE STRING STRING_TYPE DATA DEF FOR DIM GOSUB GOTO NEXT THEN IF LET INPUT PRINT REM RETURN STOP ID NOT AND OR XOR EXPO LPARENTHESIS RPARENTHESIS MULTIPLY ADD SUBTRACT DIVIDE EQUAL NOT_EQUAL LESS_THAN GREATER_THAN LESS_EQUAL GREATER_EQUAL TO STEP SEMICOLON COMMENT_STMT COMMA END

%left ADD SUBTRACT 
%left MULTIPLY DIVIDE
%right EXPO
%left NOT AND OR XOR
%left GREATER_THAN LESS_THAN GREATER_EQUAL LESS_EQUAL EQUAL NOT_EQUAL
%left LPARENTHESIS RPARENTHESIS


%%
PROG_STMT: PROGRAM EOL PROG_STMT
        | PROGRAM

PROGRAM:                  {printf("empty FILE\n");}
        | NUMBER PROG {if(counter>0){printf("INVALID: END STATEMENT ALREADY PARSED\n");}}
        | NUMBER STOP {printf("STOP DETECTED\n");if(counter>0){printf("INVALID: END STATEMENT ALREADY PARSED\n");}}
        | NUMBER END {printf("END DETECTED\n");counter++;}
        | NUMBER REM    {printf("COMMENTS\n");if(counter>0){printf("INVALID: END STATEMENT ALREADY PARSED\n");}}
;

PROG: VAR_ASSIGNMENT
    | CONDITIONAL
    | LOOP
    | PRINT_STMT
    | FUNCTION_DEF
    | ARRAY_DECLARATION
    | UNCONDITIONAL_STATEMENT
    | INPUT_STMT
    | RETURN_STMT
    | DATA_STMT
    | NEXT_STMT
;

VAR_ASSIGNMENT: LET ID ID_TYPE LPARENTHESIS EXPR COMMA EXPR RPARENTHESIS EQUAL EXPR {printf("VALID LET SYNTAX\n");}
            | LET ID ID_TYPE EQUAL VAR{printf("VALID LET SYNTAX\n");}
            | LET ID ID_TYPE EQUAL EXPR  {printf("VALID LET SYNTAX\n");}
            |{printf("INVALID SYNTAX\n");}
;

NEXT_STMT: NEXT{for_counter--;if(for_counter<0){printf("INVALID NEXT: NO CORRESPONDING GOSUB OR GOTO\n");}else{printf("VALID NEXT SYNTAX\n");}}

CONDITIONAL:    IF IF_EXPRESSION THEN EXPR
;

IF_EXPRESSION: RELATIONAL_EXPR  {printf("VALID IF SYNTAX\n");}
            |{printf("INVALID SYNTAX\n");}
;

LOOP: FOR ID EQUAL EXPR TO EXPR STEP EXPR   {for_counter++;printf("VALID FOR SYNTAX\n");}
    | FOR ID EQUAL EXPR TO EXPR {printf("VALID FOR SYNTAX\n");}
    |                               {printf("INVALID FOR SYNTAX\n");}
;

PRINT_STMT: PRINT EXPR PRINT_STMTLIST   {printf("VALID PRINT SYNTAX\n");}
    | PRINT EXPR                    {printf("VALID PRINT SYNTAX\n");}
    | PRINT                         {printf("INVALID SYNTAX\n");}
;

PRINT_STMTLIST: SEMICOLON EXPR PRINT_STMTLIST
            | COMMA EXPR PRINT_STMTLIST
            | SEMICOLON EXPR
            | COMMA EXPR
;

UNCONDITIONAL_STATEMENT: GOTO NUMBER{printf("VALID GOTO SYNTAX\n");}
                    | GOSUB NUMBER{printf("VALID GOSUB SYNTAX\n");}
                    | GOTO  {printf("INVALID GOTO SYNTAX\n");}
                    | GOSUB {printf("INVALID GOSUB SYNTAX\n");}
;

INPUT_STMT: INPUT INPUT_LIST
;

INPUT_LIST: ID ID_TYPE LPARENTHESIS VAR RPARENTHESIS COMMA INPUT_LIST{printf("VALID INPUT SYNTAX\n");}
        | ID ID_TYPE LPARENTHESIS ID ID_TYPE RPARENTHESIS COMMA INPUT_LIST{printf("VALID INPUT SYNTAX\n");}
        | ID ID_TYPE COMMA INPUT_LIST{printf("VALID INPUT SYNTAX\n");}
        | ID LPARENTHESIS VAR RPARENTHESIS{printf("VALID INPUT SYNTAX\n");}
        | ID LPARENTHESIS ID ID_TYPE RPARENTHESIS{printf("VALID INPUT SYNTAX\n");}
        | ID  ID_TYPE
        | {printf("INVALID INPUT SYNTAX\n");}
;



DATA_STMT: DATA DATA_LIST   {printf("DATA STMT OKAY\n");}
        |{printf("INVALID DATA_STMT SYNTAX\n");}
;

DATA_LIST: VAR COMMA DATA_LIST
        | VAR
;

RETURN_STMT: RETURN{printf("VALID RETURN SYNTAX\n");}
            |{printf("INVALID SYNTAX\n");}
;
ARRAY_DECLARATION: DIM ID LPARENTHESIS NUMBER RPARENTHESIS  {printf("DIM SYNTAX OKAY\n");}
                | DIM ID LPARENTHESIS NUMBER RPARENTHESIS COMMA ID LPARENTHESIS NUMBER COMMA NUMBER RPARENTHESIS  {printf("DIM SYNTAX OKAY\n");}
                | DIM {printf("INVALID DIM SYNTAX\n");}
;

FUNCTION_DEF: DEF EQUAL DECIMAL{printf("VALID DEF SYNTAX\n");}
            | DEF EQUAL DECIMAL_DOUBLE{printf("VALID DEF SYNTAX\n");}
            | DEF EQUAL DECIMAL_SINGLE{printf("VALID DEF SYNTAX\n");}
            | DEF EQUAL STRING    {printf("VALID DEF SYNTAX\n");}
            | DEF LPARENTHESIS ID RPARENTHESIS EQUAL EXPR{printf("VALID DEF SYNTAX\n");}
            | DEF{printf("INVALID SYNTAX\n");}
;

EXPR: LOGICAL_EXPRESSION
;

ARTHMETIC_EXPR: ARTHMETIC_EXPR SUBTRACT ARTHMETIC_EXPR   
    | ARTHMETIC_EXPR ADD ARTHMETIC_EXPR   
    | ARTHMETIC_EXPR DIVIDE ARTHMETIC_EXPR     {{printf("INVALID SYNTAX\n");}}
    | ARTHMETIC_EXPR MULTIPLY ARTHMETIC_EXPR   
    | SUBTRACT ARTHMETIC_EXPR   
    | ARTHMETIC_EXPR EXPO ARTHMETIC_EXPR       
    | LPARENTHESIS ARTHMETIC_EXPR RPARENTHESIS
    | ID ID_TYPE  
    | VAR
;

ID_TYPE: INT
        | SINGLE_PRECISION
        | DOUBLE_PRECISION
        | STRING_TYPE
        |
;

VAR: NUMBER           
    | DECIMAL_DOUBLE
    | DECIMAL_SINGLE
    | STRING
;

RELATIONAL_EXPR: RELATIONAL_EXPR GREATER_EQUAL RELATIONAL_EXPR
        | RELATIONAL_EXPR LESS_EQUAL RELATIONAL_EXPR
        | RELATIONAL_EXPR GREATER_THAN RELATIONAL_EXPR
        | RELATIONAL_EXPR LESS_THAN RELATIONAL_EXPR
        | RELATIONAL_EXPR NOT_EQUAL RELATIONAL_EXPR
        | RELATIONAL_EXPR EQUAL RELATIONAL_EXPR
        | ARTHMETIC_EXPR
        
;

LOGICAL_EXPRESSION: LOGICAL_EXPRESSION XOR LOGICAL_EXPRESSION 
                    | LOGICAL_EXPRESSION OR LOGICAL_EXPRESSION  
                    | LOGICAL_EXPRESSION AND LOGICAL_EXPRESSION 
                    | NOT LOGICAL_EXPRESSION        
                    | RELATIONAL_EXPR       
                    
;

%%

int main()
{
    yyin=fopen("IncorrectSample.bmm","r");
    
    yyparse();
    return 0;
}

void yyerror(char const *s){
    printf("%s\n",s);
}