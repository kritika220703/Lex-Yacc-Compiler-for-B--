%{
    #include<stdio.h>
    #include<string.h>
    #include<math.h>
    # include "y.tab.h"
    void yyerror(char const *);
    int yylex();
%}

%%
"%"    {return INT;}
"!"    {return SINGLE_PRECISION;}
"#"    {return DOUBLE_PRECISION;}
"$"    {return STRING_TYPE;}
"DATA"  {return DATA;}
"DEF FN"[A-Z]   {return DEF;}
"END"   {return END;}
"FOR"   {return FOR;}
"DIM"   {return DIM;}
"GOSUB"  {return GOSUB;}
"NEXT"   {return NEXT;}
"GOTO"   {return GOTO;}
"IF"     {return IF;}
"THEN"   {return THEN;}
"LET"    {return LET;}
"INPUT"    {return INPUT;}
"PRINT"    {return PRINT;}
"REM "[A-Z0-9 \t*]*     {return REM;}
"RETURN"    {return RETURN;}
"STOP"      {return STOP;}
"TO"        {return TO;}
"STEP"      {return STEP;}
([A-Z])([0-9]?)   {return ID;}
(\"[a-zA-Z0-9]*\") {return STRING; }
[0-9]+  {yylval=atoi(yytext); return NUMBER;}
[0-9]+"."[0-9]{17,}  {yylval=atoi(yytext); return DECIMAL;}
[0-9]+"."[0-9]{8,16}  {yylval=atoi(yytext); return DECIMAL_DOUBLE;}
[0-9]+"."[0-9]{1,7}  {yylval=atoi(yytext); return DECIMAL_SINGLE;}
";"     {return SEMICOLON;}
","     {return COMMA;}
"NOT"  {return NOT;}
"AND"  {return AND;}
"OR"   {return OR;}
"XOR"  {return XOR;}
"^"    {return EXPO;}
\(    {return LPARENTHESIS;}
\)    {return RPARENTHESIS;}
"*"    {return MULTIPLY;}
"+"    {return ADD;}
"-"    {return SUBTRACT;}
"/"    {return DIVIDE;}
"="    {return EQUAL;}
"<>"   {return NOT_EQUAL;}
"<"    {return LESS_THAN;}
">"    {return GREATER_THAN;}
"<="   {return LESS_EQUAL;}
">="   {return GREATER_EQUAL;}
"\n"    {return EOL;}
[ \t]       {;}
.       {;}
%%
