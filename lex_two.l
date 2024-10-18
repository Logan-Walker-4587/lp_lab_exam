%{
    #include <stdio.h>
    #include <string.h>
    int vowel_count = 0;
    char word[100];
    int two_count = 0;
    int i = 0; 
    int count = 0; 
%}

%%

[AEIOUaeiou] { 
    vowel_count += 1;
    word[i] = yytext[0]; 
    i++; 
}

[^ \t\n] { 
    word[i] = yytext[0]; 
    i++;
}

[ \t] { 
    if (vowel_count > 2) {
        word[i] = '\0'; 
        printf("%s\n", word); 
        count++; 
    }
    if (i >= 5) {
        two_count++; 
    }
    vowel_count = 0;
    i = 0; 
}

\n { 
    if (vowel_count > 2) {
        word[i] = '\0'; 
        printf("%s\n", word); 
        count++; 
    }
    if (i >= 5) {
        two_count++; 
    }
    return 0; 
}

%%

int main() {
    printf("Enter a sentence: ");
    yylex(); 
    printf("Number of words with more than 2 vowels: %d\n", count);
    printf("Number of words with more than 5 letters: %d\n", two_count);
    return 0;
}
