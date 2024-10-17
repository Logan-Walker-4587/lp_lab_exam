%{
#include<stdio.h>
%}

%%

[a-zA-Z_][a-zA-Z0-9_]* { printf("\nValid\n"); return 0; }
.|\n { printf("\nInvlaid \n"); return 0; }


%%

int main()
{
	printf("\nEnter a string : ");
	yylex();
    return 0;
}
