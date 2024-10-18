%{
#include <stdio.h>
int flag = 0;
int b= 0;
int lhs = 0;
int rhs = 0;
%}

OPERATOR   [\+\-\*\/\%]
IDENTIFIER [A-Za-z_][A-Za-z0-9_]*
SEMI       ;
EQUALS     =
LPAREN     \(
RPAREN     \)
MULTIPLE   {IDENTIFIER}{OPERATOR}
TERM       {IDENTIFIER}{OPERATOR}({IDENTIFIER}|{MULTIPLE}*)
MULTIPLETERM {TERM}*{OPERATOR}{TERM}*
BRACKETTERM ({LPAREN}{TERM}*{RPAREN})*


%%

{LPAREN} { b++; }
{RPAREN} { b--; }
{IDENTIFIER}{EQUALS} { lhs=1;}
{TERM} {}
{SEMI} { rhs=1; }
{MULTIPLETERM} {}
{BRACKETTERM} {}
. { 
    flag = 1; 
    return 0;
}

\n { 
    return 0; 
}

%%

int main() {
    printf("\nEnter a string: ");
    yylex();
    if (flag == 0 && lhs==1 && rhs==1 &&b==0) {
        printf("\nValid\n");
    } else {
        printf("\nInvalid\n");
    }
    return 0;
}
