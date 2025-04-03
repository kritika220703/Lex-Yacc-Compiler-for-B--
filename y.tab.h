/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    INT = 258,
    SINGLE_PRECISION = 259,
    EOL = 260,
    TERM = 261,
    DOUBLE_PRECISION = 262,
    NUMBER = 263,
    DECIMAL = 264,
    DECIMAL_DOUBLE = 265,
    DECIMAL_SINGLE = 266,
    STRING = 267,
    STRING_TYPE = 268,
    DATA = 269,
    DEF = 270,
    FOR = 271,
    DIM = 272,
    GOSUB = 273,
    GOTO = 274,
    NEXT = 275,
    THEN = 276,
    IF = 277,
    LET = 278,
    INPUT = 279,
    PRINT = 280,
    REM = 281,
    RETURN = 282,
    STOP = 283,
    ID = 284,
    NOT = 285,
    AND = 286,
    OR = 287,
    XOR = 288,
    EXPO = 289,
    LPARENTHESIS = 290,
    RPARENTHESIS = 291,
    MULTIPLY = 292,
    ADD = 293,
    SUBTRACT = 294,
    DIVIDE = 295,
    EQUAL = 296,
    NOT_EQUAL = 297,
    LESS_THAN = 298,
    GREATER_THAN = 299,
    LESS_EQUAL = 300,
    GREATER_EQUAL = 301,
    TO = 302,
    STEP = 303,
    SEMICOLON = 304,
    COMMENT_STMT = 305,
    COMMA = 306,
    END = 307
  };
#endif
/* Tokens.  */
#define INT 258
#define SINGLE_PRECISION 259
#define EOL 260
#define TERM 261
#define DOUBLE_PRECISION 262
#define NUMBER 263
#define DECIMAL 264
#define DECIMAL_DOUBLE 265
#define DECIMAL_SINGLE 266
#define STRING 267
#define STRING_TYPE 268
#define DATA 269
#define DEF 270
#define FOR 271
#define DIM 272
#define GOSUB 273
#define GOTO 274
#define NEXT 275
#define THEN 276
#define IF 277
#define LET 278
#define INPUT 279
#define PRINT 280
#define REM 281
#define RETURN 282
#define STOP 283
#define ID 284
#define NOT 285
#define AND 286
#define OR 287
#define XOR 288
#define EXPO 289
#define LPARENTHESIS 290
#define RPARENTHESIS 291
#define MULTIPLY 292
#define ADD 293
#define SUBTRACT 294
#define DIVIDE 295
#define EQUAL 296
#define NOT_EQUAL 297
#define LESS_THAN 298
#define GREATER_THAN 299
#define LESS_EQUAL 300
#define GREATER_EQUAL 301
#define TO 302
#define STEP 303
#define SEMICOLON 304
#define COMMENT_STMT 305
#define COMMA 306
#define END 307

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
