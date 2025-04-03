# Lex-Yacc Compiler for B--

## Compilation Instructions  
### 1️⃣ Using Makefile (Recommended)  
To compile the program, simply run:  
```sh
make
```
We have created a `Makefile`, and running `make` will compile everything automatically on Ubuntu.

### 2️⃣ Manual Compilation  
To compile and run separately, use the following commands:  
```sh
yacc -d BMM_Parser.y  
lex BMM_Scanner.l  
cc lex.yy.c y.tab.c -o a.exe -ll  
./a.exe
```
Alternatively, all steps can be executed in a single command:  
```sh
yacc -d BMM_Parser.y; lex BMM_Scanner.l; cc lex.yy.c y.tab.c -o a.exe -ll; ./a.exe
```

## 📥 Input  
The program processes input from `CorrectSample.bmm`.  

## 📤 Output  
- **VALID SYNTAX** → Printed for lines following the correct syntax.  
- **INVALID SYNTAX** → Printed for lines with syntax errors.  

### 🔄 Changing Input File  
By default, the program runs with `CorrectSample.bmm`.  
To use `IncorrectSample.bmm`, modify the input file reference in the Yacc code.

## ⚠️ Syntax Rules  
- A statement **must start with an integer**.  
- It **should not start with a string, decimal, or identifier**.  
- Violating this rule results in a **syntax error**.
