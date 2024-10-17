%{
   #include<stdio.h>
   int vowels = 0;
   int consonants = 0;
   int flag = 0;
%}

%%

[aeiouAEIOU] { vowels++; }
[a-zA-z] { consonants++; }
[ \t] {}
\n { return 0; }
. { printf("\n invalid"); flag = 1; return 0; }

%%
int main()
{
    printf("\nEnter a string : ");
    yylex();
    if (flag==0){
    printf("\nNo of vowels = %d",vowels);
    printf("\nNo of consonants = %d",consonants);
    }
    return 0;
}