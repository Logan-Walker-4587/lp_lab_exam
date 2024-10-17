%{
#include <stdio.h>
int flag = 1;
%}

OPERATOR   [\+\-\*\/\%]
IDENTIFIER [A-Za-z_][A-Za-z0-9_]*
SEMI       ;
EQUALS     =
LPAREN     \(
RPAREN     \)
TERM       {LPAREN}{IDENTIFIER}{OPERATOR}{IDENTIFIER}{RPAREN}
MULTIPLE   {LPAREN}{TERM}*{RPAREN}

%%


{IDENTIFIER}{EQUALS}{IDENTIFIER}{SEMI} {
    flag = 0; 
}
{IDENTIFIER}{EQUALS}({TERM}|{MULTIPLE})*{SEMI} { flag =0;}


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
    if (flag == 0) {
        printf("\nValid\n");
    } else {
        printf("\nInvalid\n");
    }
    return 0;
}
