%{
    #include<stdio.h>

%}

%%

[A-Za-z_][A-Za-z0-9_]*[=][A-Za-z_][A-Za-z0-9_]*[\+\-\*\%][A-Za-z_][A-Za-z0-9_]*[\;] { printf("\nValid"); return 0; }
. { printf("\nInvalid\n"); return 0; }

%%

int main()
{
    printf("\nEnter a string : ");
    yylex();
    return 0;
}