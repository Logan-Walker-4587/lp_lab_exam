%{
    #include<stdio.h>
    int wc = 0;
%}

%%

[a-zA-Z]* {} 
[ \t] { wc++; }
\n { wc++;
    return 0; }
. {}

%%

int main(int argc , char* argv[])
{
    FILE* fd = fopen(argv[1],"r");
    yyin = fd;
    yylex();
    printf("\n no .of words = %d",wc);
    return 0;
}