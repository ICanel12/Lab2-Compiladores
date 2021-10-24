/*%{
	#define OR 10
	#define AND 11
	#define NOT 12
	#define TRUE 13
	#define FALSE 14
	
%}*/

OR		[Oo][Rr]
AND 	[Aa][Nn][Dd]
NOT		[Nn][Oo][Tt]
TRUE	[Tt][Rr][Uu][Ee]
FALSE	[Ff][Aa][Ll][Ss][Ee]

%%
[\n()]    return yytext[0];
[ \t]		; { /* Espacios en blanco */ }
{AND}	{return AND; }
{OR}	{return OR; }
{NOT}	{return NOT; }
{TRUE}	{yylval = 1; return (TRUE);}
{FALSE} {yylval = 0; return (FALSE);}
.		printf("Error\n");
%%

int yywrap(void)
{
	return 0;
}
/*
main(){
	int token;
	token = yylex();
	while (token){
		printf("%d\n", token);
		token = yylex();
	}
}*/