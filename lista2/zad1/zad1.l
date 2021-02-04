/* Patryk Majewski, 250134 */

%{
#include <stdio.h>

int yywrap();
int yylex();

int lines = 0;
int words = 0;
%}

WHITESPACE [[:blank:]]|\\\n
%s START
%s NEWLINE
%s WORD
%s SPACES
%%
    BEGIN(START);

<NEWLINE,START>{WHITESPACE}|\n ;
<NEWLINE,START><<EOF>> return 0;
<NEWLINE>. printf("\n"); REJECT;
<NEWLINE,START>. ECHO; BEGIN(WORD); words++; lines++;

<WORD>[[:blank:]] BEGIN(SPACES);
<WORD>\\\n ;
<WORD>\n BEGIN(NEWLINE);

<SPACES>{WHITESPACE} ;
<SPACES>\n BEGIN(NEWLINE);
<SPACES>. printf(" "); ECHO; BEGIN(WORD); words++;
%%

int yywrap() { 
    printf("\n");
    printf("line count: %d\n", lines);
    printf("word count: %d\n", words);
    return 1; 
} 
int main() { 
    return yylex(); 
}
