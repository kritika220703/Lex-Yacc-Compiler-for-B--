# Lex-Yacc-Compiler-for-B--

To compile the program run -
1) make:
We have created a Makefile, and running make will compile everything automatically on Ubuntu.

2) To run seperately - 
   a. yacc -d BMM_Parser.y
   b. lex BMM_Scanner.l
   c. cc lex.yy.c y.tab.c -o a.exe -ll
   d. ./a.exe

or it can be given in this way also -
yacc -d BMM_Parser.y; lex BMM_Scanner.l; cc lex.yy.c y.tab.c -o a.exe -ll; ./a.exe


INPUT- we have given input to the program as CorrectSample.bmm

OUTPUT - we are giving the output in terminal and we will be printing VALID SYNTAX for the line which has the correct syntax 
	   We are printing INVALID SYNTAX for the line which has the invalid syntax

BY default the file with the correct syntax will run, to change it in the code of yacc file change the input file to "IncorrectSample.bmm"

The statement should start with integer not with string, decimal and identifier etc. otherwise it gives syntax error
