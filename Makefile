all:
	yacc -d BMM_Parser.y; lex BMM_Scanner.l; cc lex.yy.c y.tab.c -ll; ./a.out