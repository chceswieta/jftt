/* Patryk Majewski, 250134 */

%{
#include <iostream>
#include <string>
#include <stack>
#include <cmath>
using namespace std;

int yylex();
string error_msg;
stack<int> numbers;
int x,y;
%}

binaryops  [\+\-\*\^/%]
nonzeroops [/%]
%x ERROR
%%

\-?[0-9]+ {
    ECHO; 
    numbers.push(stoi(yytext));
}

[^0-9\+\-\*\^/%\n ] {
    error_msg = "Błąd: zły symbol \"" + (string)yytext + "\"";
    ECHO;
    BEGIN(ERROR);
}

{binaryops} {
    ECHO;
    if (numbers.size() > 1) {
        y = numbers.top();
        numbers.pop();
        x = numbers.top();
        numbers.pop();
        REJECT;
    }
    else {
        error_msg = "Błąd: za mała liczba argumentów";
        BEGIN(ERROR);
    }
}

{nonzeroops} {
    if (y == 0) {
        error_msg = "Błąd: dzielenie przez 0";
        BEGIN(ERROR);
    }
    else
        REJECT;
}

"+" numbers.push(x+y);
"-" numbers.push(x-y);
"*" numbers.push(x*y);
"^" numbers.push((int)pow(x,y));
"/" numbers.push(x/y);
"%" numbers.push(x%y);

<<EOF>> {
    if (numbers.size() > 1)
        cout << "Błąd: za mała liczba operatorów" << endl;
    else
        cout << "= " << numbers.top() << endl;
    return 1;
}

\n {
    ECHO;
    if (numbers.size() > 1) {
        cout << "Błąd: za mała liczba operatorów" << endl;
        numbers = *(new stack<int>);
    }
    else {
        cout << "= " << numbers.top() << endl;
        numbers.pop();
    }
        
}

<ERROR>\n {
    ECHO; 
    cout << error_msg << endl; 
    numbers = *(new stack<int>);
    BEGIN(0);
}

%%

int yywrap() { 
    printf("\n");
    return 1; 
} 
int main() { 
    return yylex(); 
}