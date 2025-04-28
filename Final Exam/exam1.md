### What is a programming language primarily intended for?

a. Communicating between humans only
**b. Facilitating human-machine interaction**
c. Only executing machine-level code
d. Writing algorithms in natural language

---

### Which of the following best describes declarative programming?

Uses class hierarchies and inheritance
**Focuses on logic and what should be done**
Relies on modifying shared state
Follows a step-by-step sequence of comman

---

### Which of the following is NOT a function of SQL?

Querying data
**Writing low-level assembly code**
Creating and modifying database structures
Inserting and updating records


---

### What does the following query do?
```sql
SELECT name FROM instructor WHERE salary > (SELECT AVG(salary) FROM instructor);
```

Finds the highest-paid instructor
Lists all instructors' salaries
**Finds instructors earning above the average salary**
Returns the maximum salary


---

### Write an SQL query to list the names and salaries of instructors earning more than $90,000.
Hint: You may want to use the instructor table.

```sql
select name,salary from instructor where salary > 90000.00
```

---

### Which of the following statements about Prolog is TRUE?

Prolog requires explicit looping structures
Prolog does not support recursion
**Prolog infers new facts using rules and queries**
Prolog executes programs sequentially like C or Java

---

### Which of the following is a valid Prolog fact?

**parent(john, mary).**
parent(X, Y) = true.
fact(parent, X, Y).
function parent(john, mary).

---

### Which of the following Prolog statements will successfully unify?

3 = 2 + 1.
father(john, X) = parent(X, john).
X = john, X = mary.
**X = 5, Y = X.**

---

### Which of the following queries will FAIL due to unification rules?

?- X = foo(bar), Y = foo(bar).
?- point(X, 2) = point(3, Y).
**?- foo(X) = bar(X).**
?- X = 5, X = Y.

---

### Prolog Unification
```prolog
mystery1(a,1).
mystery1(b,2).

mystery2([], 0).
mystery2([A|B], Soln) :-
  	mystery1(A, C),     % look up A’s numeric value C
  	mystery2(B, D),     % recurse on the tail B, getting sum D
  	Soln is C + D.      % Soln = C plus D
```
#### Logic
	mystery1/2 defines a simple lookup:
		a → 1
		b → 2
	mystery2/2 sums those values across a list:
		Base case: an empty list [] has sum 0.
		Recursive case: for [A|B], fetch C such that mystery1(A,C), recurse to get D = sum(B), then Soln = C+D.

#### Example
	`?- mystery2([a,b,a], Sum).`
	```
	1) Call: mystery2([a,b,a], Sum)
		• matches [A|B] clause with A = a, B = [b,a]
	2)   Call: mystery1(a, C)
		→ C = 1
	3)   Call: mystery2([b,a], D)
		a) matches [A|B]: A = b, B = [a]
	4)     Call: mystery1(b, C1)
			→ C1 = 2
	5)     Call: mystery2([a], D1)
			i) matches [A|B]: A = a, B = []
		6)       Call: mystery1(a, C2)
				→ C2 = 1
		7)       Call: mystery2([], D2)
				→ base case: D2 = 0
		8)       Compute Soln2: C2 + D2 = 1 + 0 = 1  
				→ D1 = 1
	9)     Compute Soln1: C1 + D1 = 2 + 1 = 3  
				→ D = 3
	10)  Compute final Soln: C + D = 1 + 3 = 4  
		→ Sum = 4

	Return to top: 
	?- mystery2([a,b,a], Sum).
	Sum = 4.
```


