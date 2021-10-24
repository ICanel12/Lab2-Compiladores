%{
	#include <ctype.h>
	#include <stdio.h>
	#define YYSTYPE double /* double type for Yacc stack */
	
	extern int yylex();
	void yyerror(char *msg);
%}

%token OR
%token AND
%token NOT
%token TRUE
%token FALSE

%%
lines	: lines bexpr '\n' { printf($2 ? "TRUE(1)\n" : "FALSE(0)\n") ;}
		| lines '\n'
		| /* empty */
		;
	
	
bexpr	: bexpr OR bterm	{ $$ = $1 || $3 }
		| bterm;

bterm	: bterm AND bfactor { $$ = $1 && $3 }
		| bfactor;
		
bfactor	: NOT bfactor { $$ = !$2 }
		| '(' bexpr ')' { $$ = $2 }
		| TRUE { $$ = $1 }
		| FALSE { $$ = $1 }
		
%%

#include "lex.yy.c";

void yyerror(char *msg){
	printf("Error de sintaxis");
	exit(0);
}

main(){
	yyparse();
	return 0;
}