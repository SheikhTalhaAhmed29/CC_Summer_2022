# Phase 3

Conversion of C Code to Python Code using YACC

## What is LEX?

LEX is a tool used to generate a lexical analyzer. The input is a set of regular expressions in addition to actions. The output is a table driven scanner called lex.yy.c.
What is YACC?

## Introduction Of YACC
YACC (Yet Another Compiler Compiler) is a tool used to generate a parser. It parses the input file and does semantic analysis on the stream of tokens produced by the LEX file. YACC translates a given Context Free Grammar (CFG) specifications into a C implementation y.tab.c. This C program when compiled, yields an executable parser.


## Aproach Used:

Making a Lexical Analyzer was generally more easy than the Parser at the same time, after reading a lot of documentations and cooperative work, we figured out how to make it happen accurately.
Working:

After download, compile the documents to make an executable, run the executable to parse the source code. There are two methods for giving source code to the executable, we have two methods to set input strings to the executable, first from the standard input in the cl(command line), second from a text file. The executable would parse the source program and let user know, whether there are any parsing errors in the program.

## YACC and Flex Compilation

* lex lexer.l
* yacc -d parser.y -v
* gcc -w -g y.tab.c -ly -ll -o semantic_analyser

## The problems faced:
In Language grammar interpreting:

It took a long time to understand the Mini-C language grammar,but as soon as we study things from our course and internet the things start making sense and become understandable.
In the scanner with parser integration:

It was very difficult to find flex and yacc programs integration so we found an easy example on our website of course and we took help from it.

## Elimination of the grammar conflicts in parser:

At the initial implementation of parser we faced huge number of conflicts in grammar because there are many places where we have clear grammar without (fuzzy rules) but the yacc cannot handle it because it generates LALR(1) parsers by default with limited look ahead ability.
By specifying the associativity property of different operators, we resolve many shift/reduce issues in the yacc program, and by opening and closing curly braces {} the remaining conflicts were eliminated and also we resolve some statements by using various precedence rules to associate else with the nearest if.

## Input File Of Code
![image](https://user-images.githubusercontent.com/57304670/184992786-c2c0dce5-7f5c-464e-9419-aeef15936bc4.png)

## Output File Of Python Code
![image](https://user-images.githubusercontent.com/57304670/184992996-bbc21e12-be81-47dd-b07f-1a6ba3d01807.png)

