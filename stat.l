%{
#include<stdio.h>
int stat=0;
int flag=0;
int id=0;
int assign=0;
int in=0;
int rel=0;
int key=0;
%}

%%
"for"|"while"|"if"|"else" {flag=1;key++;}
")"	flag=0;
"int"|"float"|"double"|"main" {key++;}
;	{if(!flag)stat++;}
"=="|"!="|"<="|">="|"<"|">"	{rel++;}
"=" {assign++;}
[0-9]+	{in++;}
[a-zA-Z_][a-zA-Z0-9]*	{id++;}
. ;
%%

int yywrap(){
	return 1;
}

int main(int argc, char *argv[]){
	FILE *inn = fopen(argv[1],"r");
	yyin=inn;
	yylex();
	printf("number of statements: %d\n",stat);
	printf("keywords: %d\n",key);
	printf("assignment: %d\n",assign);
	printf("relational: %d\n",rel);
	printf("integers: %d\n",in);
	printf("identifiers: %d\n",id);
	fclose(inn);
	return 0;
}
