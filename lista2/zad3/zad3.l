/* Patryk Majewski, 250134 */

%{
#include <stdio.h>

int yylex();
int yywrap();

int delete_docs = 1;
%}

string              \"([^"\n\\]|{esc_char}|\\\n)*\"
esc_char            \\([[:alnum:]\\'"?]{-}[xuU]|[0-7]{1,3}|x[0-9a-fA-F]{1,2}|u[0-9a-fA-F]{4}|U[0-9a-fA-F]{8})

doc_comment         {long_doc}|{short_doc}
long_doc            {long_doc_prefix}{long_element}*"*/"
short_doc           {short_doc_prefix}{short_element}*\n
long_doc_prefix     "/\**"|"/\*!"
short_doc_prefix    "///"|"//!"

regular_comment     {long_comment}|{short_comment}
long_comment        "/\*"{long_element}*"*/"
short_comment       "//"{short_element}*\n
long_element        [^/]|[^*]"/"
short_element       .|\\\n

%%

{string}            ECHO;
{doc_comment}       if (!delete_docs) ECHO;
{regular_comment}   ;

%%

int yywrap() { 
    printf("\n");
    return 1; 
} 
int main(int argc, char** argv) {
    if (argc > 1 && strcmp(argv[1], "-d") == 0) {
        delete_docs = 0;
    }
    return yylex(); 
}