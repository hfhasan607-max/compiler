%{
#include <stdio.h>
%}

/* Option to avoid linking with -lfl */
%option noyywrap

%%

[0-9]+              { printf("INTEGER: %s\n", yytext); }
[0-9]+\.[0-9]+      { printf("FLOAT: %s\n", yytext); }
if|else|while|for|int|float|main   { printf("KEYWORD: %s\n", yytext); }
[a-zA-Z][a-zA-Z0-9]* { printf("IDENTIFIER: %s\n", yytext); }
[ \t\n]+            { /* Ignore whitespace */ }
[=+*/%-]            {printf("ARITHMETIC_OP: %s\n",yytext); }
(&&)|(\|\|)|!       { printf("LOGICAL_OP: %s\n", yytext); }
[=,/,*,-,%,+]+      { printf("Operator: %s\n", yytext); }
.                   { printf("UNKNOWN: %s\n", yytext); }

%%

int main() {
    /* Open the file directly */
    yyin = fopen("input.txt", "r");
   
    yylex();
    return 0;
}