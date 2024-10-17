%{
    #include<stdio.h>
    int open_parens = 0, close_parens = 0;
    int flag = 0;
%}

%%

[\(] { open_parens++; }     
[\)] { close_parens++; }    

[A-Za-z_][A-Za-z0-9_]*[=]([A-Za-z_][A-Za-z0-9_]*|[\(]([A-Za-z_][A-Za-z0-9_]*[\+\-\*\/\%])*[A-Za-z_][A-Za-z0-9_]*[\)])*; {
    flag = 0; 
}


. { printf("\nInvalid\n"); flag = 1; return 0; }

\n { return 0; }

%%

int main()
{
    printf("\nEnter a string : ");
    yylex();
    if (open_parens == close_parens && flag == 0)
    {
        printf("\nValid\n");
    }
    else
    {
        printf("\nInvalid\n");
    }
    return 0;
}
