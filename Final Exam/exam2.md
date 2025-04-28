### BNF is:

D) A tool for describing semantics
A) Backus Naur Form
**E) Both A and C**
B) A type of bicycle of off-road racing
C) A language for writing programming language grammars

---

### ALL CFG can be expressed as a regular expression without changing the language they represent.

True
**False**

---

### Regular expressions are used in a wide range of programs wherever simple pattern recognition is needed, but they are really just a more compact way to represent T3 grammars.

**True**
False

---

### In the following grammar:
```
thing ::= letter{letter−or−digit}
letter ::= a|b|c|...|z|...|A|...|Z
digit ::= 0|1|2|3|4| . . . |9letter−or−digit ::= letter|digit
```
A `thing` would be better known to us as a:

E) All of the above
**C) Identifier**
A) Reserved word
B) Conditional
D) Expression

---

### Matching

A character for symbol that appears in the program -> **terminal**
Zero or more copies of a regular expression -> **Kleene Star**
Start with S and then expand with productions to fit the input -> **top-down parse**
Right hand side of production can be only a single terminal or two non-terminals -> **Chomsky Normal Form**
A set of strings that each match a given grammar -> **language**
Reading the input and converting to tokens or pseudo-terminals -> **scanner**
using productions to determine the grammatical structure of the program -> **parser**
Pre-defined words that are part of the language eg. while, if, for -> **reserved words**
Pseudo-terminals found by processing input characters -> **tokens**

---

### Given the LGN rule:
```
returnarg(ide(Returnarg)) --> [lparen], [ide(Returnarg)], [rparen].
```
Which of the following is the correct corresponding Prolog predicate?

returnarg(A, [lparen|B], C) :- B = [ide(A)|C], C = [rparen|D].
returnarg(ide(A), B, C) :- B = [lparen|D], D = [ide(A), rparen|C].
**returnarg(ide(A), [lparen|B], C) :- B = [ide(A)|D], D = [rparen|C].**
returnarg(ide(Returnarg), [lparen, ide(Returnarg), rparen|C], C).

---

### In flex, what does the following RE match: //.*

Any string containing double slashes
Multi-line comments
**Single-line comments starting with //**
The division operator

---

### Write a regular expression that specifies a language consisting of strings containing a's and b's and c's in any order except, once c has appeared in the string, no more a's may appear in the string, b's may appear tho

$(a\mid b)^{*}(b\mid c)^{*}$
