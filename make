bison -y -d golub.y 
flex golub.l
gcc -c y.tab.c lex.yy.c
gcc y.tab.o lex.yy.o -o Parser.exe

./myParser.exe test_file.txt
