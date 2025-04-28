## In lambda calculus, what is the main purpose of abstraction in expressions like λx.x?

To bind variables to constant values
To define functions with parameters
To apply functions to multiple arguments simultaneously
To evaluate functions directly

**To define functions with parameters**

---

## Is the following a syntactically correct λ-calculus expression?

((λ x.x) 4)

True

```
((λx. x) 4)
→ [4/x]x         ︱ substitute 4 for x in the body “x”
→ 4              ︱ the body was just x, now 4
```
Note: Whenever you see [value/variable] expression, just think “plug that value in for every occurrence of that variable.”

---

## Is the following a syntactically correct λ-calculus expression?

(((λ x.(λ y.(+ x y))) 5) 6)

True

```
(((λx. (λy. (+ x y))) 5) 6)
→ (λy. (+ 5 y))6     ︱ substitute 5 for x in λy.(+ x y)
→ (+ 5 6)            ︱ substitute 6 for y
→ 11                 ︱ compute 5 + 6
```

---

```ocaml
let rec f1 = function(i, list) ->
	if (list = []) then failwith "index no present in list"
	else 
		if (i = 0) then (List.tl list)
		else
			f1((i - 1), (List.t1 list))

let rec f2 = function (list1, list2) ->
	if (list1 = [] || list2 = []) then []
	else 
		f1((List.hd list1), list2) :: f2((List.t1 list1), list2)
```

## Show below the signatures of functions f1 and f2. Show one function per line and in the format ocaml would report the signature

**ANS 1**
val f1 : int * ’a list -> ’a list = <fun>
	In plain English: 
		“f1 is a function that takes a pair (i, lst)—where i is an int and lst is a list of some type—and returns another list of that same type.”

**ANS 2** 
val f2 : int list * ’a list -> ’a list list = <fun>
	In plain English:
		"f2 is a function that takes a pair (list1, list2)
			- where list1 is a list of integers (int list)
			- and list2 is a list of some arbitrary type (’a list)
		and returns a list of lists of that same arbitrary type (’a list list)."

## Define the output
### f2([2;0], [14;23;47;4]);;
`- : int list list = [[4]; [23; 47; 4]][[4]; [23;47;4]]`
	f2 ([2;0], [14;23;47;4])
	it1:
		```
		list1 = [2;0], so
		head = 2
		tail = [0]
		f1 (2, [14;23;47;4])
		f1(2, [14;23;47;4]) → f1(1, [23;47;4])
		f1(1, [23;47;4]) → f1(0, [47;4])
		f1(0, [47;4]) → List.tl [47;4] → [4]
		so the first element of the result is [4]
		recursive tail call:
		f2 ([0], [14;23;47;4])
		```
	it2:
		now list1 = [0], so
		head = 0
		tail = []
		f1 (0, [14;23;47;4]) → List.tl [14;23;47;4] → [23;47;4]
		second element is [23;47;4]
		recursive tail call:
		f2 ([], [14;23;47;4])  =  []

	Putting it all together:
	[ [4] ; [23;47;4] ]

### f2([2;6], [14;23;47;4])
`- : Exception: Failure "index no present in list".`
	Passing 6 (or 4, or anything ≥ 4) into f1 will overshoot and trigger the exception.

### f2([2;0], [])
`- : int list list = []`

### f2([1;1;0;1], [4;23])
`- : int list list = [[]; []; [23]; []]`
	trace f2([1;1;0;1], [4;23]):
		head = 1 → f1(1, [4;23]) → strip 4 → [23], then List.tl [23] → []
		head = 1 again → same as (1) → []
		head = 0 → f1(0, [4;23]) → List.tl [4;23] → [23]
		head = 1 again → same as (1) → []

## f2([2;1], [23;56;43;99])
**f1 is called 2 times**
**f2 is called 3**
Let n be the length  of the first list [2;1]
f1 will always be called n times, f2 will always be called n + 1 times
