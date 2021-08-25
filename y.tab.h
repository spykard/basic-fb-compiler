
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     EXTERN = 258,
     VOID = 259,
     LEFT_P = 260,
     RIGHT_P = 261,
     DELIM = 262,
     INTEGER = 263,
     BOOLEAN = 264,
     STRING = 265,
     COM = 266,
     AMP = 267,
     BEGINN = 268,
     ENDD = 269,
     LEFT_C = 270,
     RIGHT_C = 271,
     IF = 272,
     ELSE = 273,
     FOR = 274,
     WHILE = 275,
     SET = 276,
     RETURN = 277,
     LOG_0 = 278,
     LOG_1 = 279,
     LOG_2 = 280,
     LOG_3 = 281,
     LOG_4 = 282,
     LOG_5 = 283,
     LOG_6 = 284,
     LOG_7 = 285,
     LOG_8 = 286,
     ADD = 287,
     SUB = 288,
     MUL = 289,
     DIV = 290,
     MOD = 291,
     TRUE = 292,
     FALSE = 293,
     INT = 294,
     IDENT = 295
   };
#endif
/* Tokens.  */
#define EXTERN 258
#define VOID 259
#define LEFT_P 260
#define RIGHT_P 261
#define DELIM 262
#define INTEGER 263
#define BOOLEAN 264
#define STRING 265
#define COM 266
#define AMP 267
#define BEGINN 268
#define ENDD 269
#define LEFT_C 270
#define RIGHT_C 271
#define IF 272
#define ELSE 273
#define FOR 274
#define WHILE 275
#define SET 276
#define RETURN 277
#define LOG_0 278
#define LOG_1 279
#define LOG_2 280
#define LOG_3 281
#define LOG_4 282
#define LOG_5 283
#define LOG_6 284
#define LOG_7 285
#define LOG_8 286
#define ADD 287
#define SUB 288
#define MUL 289
#define DIV 290
#define MOD 291
#define TRUE 292
#define FALSE 293
#define INT 294
#define IDENT 295




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


