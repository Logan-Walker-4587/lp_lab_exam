%{
    #include<stdio.h>
    int r=0,a=0,num=0,id=0,s=0,assign=0;
%}

%%

"int"|"return"|"if"|"else"|"while"|"for"|"include"|"printf"|"scanf"|"main"|"void"|"char"|"float"|"double"|"{"|"}"|"("|")"|"#include<stdio.h>" {}
[\+\-\*\%] { a++; }
[A-Za-z_][A-Za-z0-9_]* { id++; }
[\>\<\=\!][=] { r++; }
[=] { assign++; }
[0-9]* { num++; }
; { s++; }
\n {}
. {}


%%

int main(int argc , char* argv[])
{
    FILE* fd = fopen(argv[1],"r");
    
    
    if (!fd) {
        printf("File opening failed");
        return 1;
    }
    yyin = fd;
    yylex();

    fclose(fd);
    printf("Number of statements: %d\n", s);
    printf("Number of integers: %d\n", num);
    printf("Number of arithmetic operators: %d\n", a);
    printf("Number of relational operators: %d\n", r);
    printf("Number of identifiers: %d\n", id);
    printf("Number of assignment: %d\n", assign);
    return 0;

}
