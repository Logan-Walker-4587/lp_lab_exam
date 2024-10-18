%{
    #include<stdio.h>
    #include<stdlib.h>
    int a, b;
    char op;
    int result = 0;
    int op1=0;
%}

%%

[0-9]+ {
        if (op1==0)
        {
        a = atoi(yytext);  
        }
        else
           b = atoi(yytext); 
    }


[\+\-\*\/] {
    op = yytext[0]; 
    op1 = 1;

}

; {
    if (op == '+') {
        result = a + b;
    } else if (op == '-') {
        result = a - b;
    } else if (op == '*') {
        result = a * b;
    } else if (op == '/') {
        result = a / b;
    }
    return 0;
}

%%

int main()
{
    printf("\nEnter a string : ");
    yylex();
    printf("result = %d\n", result);
    return 0;
}
