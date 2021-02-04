/* Patryk Majewski, 250134 */

%{
#include <stdio.h>

int yywrap();
int yylex();
%}

stringliteral   {stringprefix}?({shortstring}|{longstring})
stringprefix    r|u|R|U|f|F|fr|Fr|fR|FR|rf|rF|Rf|RF
shortstring     "'"({shortstringitem}|\")*"'"|\"({shortstringitem}|')*\"
longstring      "'''"{longstringitem}*"'''"|\"{3}{longstringitem}*\"{3}
shortstringitem {shortstringchar}|{stringescapeseq}
longstringitem  {longstringchar}|{stringescapeseq}
shortstringchar [^\\\n\"']
longstringchar  [^\\]
stringescapeseq [\\].

%%

{stringliteral} ECHO;
#.*$ ;

%%

int yywrap() { 
    printf("\n");
    return 1; 
} 
int main() { 
    return yylex(); 
}