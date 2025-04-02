# 3. Regular Expressions are used in a wide range of programs wherever simple pattern recognition is needed, but they are really just a more compact way to represent T3 grammars.

True / False

**True**
- Regular expressions are just a shorthand, compact notation for describing Type 3 grammars
- They power the token recognition phase of compilers and interpreters
- They are semantically equivalent to right-linear grammars, i.e., T3 grammars

For example: 
`<identifier> ::= <letter> | <identifier> <letter> | <identifier> <digit>`
Equivalent regex:
`[a-zA-Z][a-zA-Z0-9]*`

---

In the following grammar: 
```
thing ::= letter{letter-or-digit}
letter ::= a|b|c|...|z|...|A|...|Z|
digit ::