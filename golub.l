%{	
	#include "y.tab.h"  
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
%}
		
%option noyywrap
%option yylineno 
/*Maintains the current line as a global variable*/

/*Names*/

digit [0-9]
num	{digit}+
sign ("+"|"-")
signed {sign}{digit}+
identifier [a-zA-Z][a-zA-Z0-9]*
whitespace [ \t\n]

%% /*Rules*/

"extern" {printf("----|TYPE: %s\n", yytext); return EXTERN;}
"void" {printf("----|TYPE: %s\n", yytext); return VOID;}
"(" {printf("   --|SYMBOL: %s\n", yytext); return LEFT_P;}
")" {printf("   --|SYMBOL: %s\n", yytext); return RIGHT_P;}
";" {printf("   --|SYMBOL: %s\n", yytext); return DELIM;}
"integer" {printf("----|TYPE: %s\n", yytext); return INTEGER;}
"boolean" {printf("----|TYPE: %s\n", yytext); return BOOLEAN;}
"string" {printf("----|TYPE: %s\n", yytext); return STRING;}
"," {printf("   --|SYMBOL: %s\n", yytext); return COM;}
"&" {printf("   --|SYMBOL: %s\n", yytext); return AMP;}
"begin" {printf("    -|FLOW: %s\n", yytext); return BEGINN;}
"end" {printf("    -|FLOW: %s\n", yytext); return ENDD;}
"{" {printf("   --|SYMBOL: %s\n", yytext); return LEFT_C;}
"}" {printf("   --|SYMBOL: %s\n", yytext); return RIGHT_C;}
"if" {printf("   -|FLOW: %s\n", yytext); return IF;}
"else" {printf("   -|FLOW: %s\n", yytext); return ELSE;}
"for" {printf("   -|FLOW: %s\n", yytext); return FOR;}
"while" {printf("   -|FLOW: %s\n", yytext); return WHILE;}
"=" {printf("   -|CALC: %s\n", yytext); return SET;}
"return" {printf("   -|FLOW: %s\n", yytext); return RETURN;}
"||" {printf("   -|CALC: %s\n", yytext); return LOG_0;}
"&&" {printf("   -|CALC: %s\n", yytext); return LOG_1;}
"!" {printf("   -|CALC: %s\n", yytext); return LOG_2;}
"==" {printf("   -|CALC: %s\n", yytext); return LOG_3;}
"!=" {printf("   -|CALC: %s\n", yytext); return LOG_4;}
"<" {printf("   -|CALC: %s\n", yytext); return LOG_5;}
">" {printf("   -|CALC: %s\n", yytext); return LOG_6;}
"<=" {printf("   -|CALC: %s\n", yytext); return LOG_7;}
">=" {printf("   -|CALC: %s\n", yytext); return LOG_8;}
"+" {printf("   -|CALC: %s\n", yytext); return ADD;}
"-" {printf("   -|CALC: %s\n", yytext); return SUB;}
"*" {printf("   -|CALC: %s\n", yytext); return MUL;}
"/" {printf("   -|CALC: %s\n", yytext); return DIV;}
"%" {printf("   -|CALC: %s\n", yytext); return MOD;}
"true" {printf("   --|BOOL: %s\n", yytext); return TRUE;}
"false" {printf("   --|BOOL: %s\n", yytext); return FALSE;}

{num} {printf("  |NUMBER: %s\n", yytext); yylval = atoi(yytext); return INT;}
{identifier} {printf("  |IDENT: %s\n", yytext); return IDENT;}
{whitespace} {}

%%