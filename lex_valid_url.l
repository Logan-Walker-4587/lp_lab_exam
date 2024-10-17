%{
    #include<stdio.h>
%}

%%

www\.[A-Za-z0-9]+\.[c][o][m] { printf("\nValid"); return 0; }
. { printf("\nInvalid"); return 0; }

%%

int main()
{
    printf("\nEnter a string : ");
    yylex();
    return 0;
}