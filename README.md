# Basic Flex & Bison Compiler

A basic compiler implementing a certain set of EBNF rules.

Run using the `make` file:

``` bash
bison -y -d golub.y 
flex golub.l
gcc -c y.tab.c lex.yy.c
gcc y.tab.o lex.yy.o -o Parser.exe

./myParser.exe test_file.txt
```