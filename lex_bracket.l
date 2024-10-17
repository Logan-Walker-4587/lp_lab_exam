%{
    #include<stdio.h>
    FILE* dest;
%}

%%

"{" { fprintf (dest,"\nbegin\n"); }
"}" { fprintf(dest,"\nend\n"); }
. { fprintf(dest,"%s",yytext); }

%%

int main(int argc , char* argv[])
{
    FILE* source = fopen(argv[1],"r");
    dest = fopen(argv[2],"w");
    yyin = source; 
    yylex();
    fclose(source);
    fclose(dest);
    return 0 ;
}