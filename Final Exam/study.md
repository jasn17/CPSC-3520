# OCAML (And how it works)

---

## Take first duplicate for example: 
```ocaml
let first_duplicate lst =
  let rec appears_in elem lst =
    match lst with
    | [] -> false 
    | head :: tail -> if head = elem then true else appears_in elem tail
  in

  let rec find_first = function
    | [] -> -10000  
    | head :: tail -> 
      if appears_in head tail then head  
      else find_first tail  
  in
  find_first lst;;
```

`let first_duplicate lst` defines the function named 'first_duplicate' and takes list input 'lst'
`let rec appears_in elem lst` and `let rec find_first` follows with 'rec' meaning these are recursive functions

`let rec find_first` is called first becuase at the end of the function expression `find_first lst;;`
### Example
	first_duplicate [1;2;3;2;4];;
### Logic
	`let rec find_first = function` will run first
	Base case `[] -> -10000` is always defined first (-10000 is arbitary)
	Recursive case `head :: tail` means the 
		head = the current iteration list's first element
		tail = the rest of the list 
		it1:
			head = [1]
			tail = [2;3;2;4]
		`if appears_in head tail then head` means if [1] can be found in [2;3;2;4] then return 1
			`let rec appears_in elem lst`
				elem = 1
				lst = [2;3;2;4]
				[2;3;2;4] is [] then return false
				head = 2, tail = [3;2;4], if 1 = 2 then true else `appears_in 1 [3;2;4]`

				elem = 1
				lst = [3;2;4]
				[3;2;4] is [] then return false
				head = 3, tail = [2;4], if 1 = 3 then true else `appears_in 1 [2;4]`

				elem = 1
				lst = [2;4]
				[2;4] is [] then return false
				head = 2, tail = [4], if 1 = 2 then true else `appears_in 1 [4]`

				elem = 1
				lst = [4]
				[4] is [] then return false
				head = 4, tail = [], if 1 = 4 then true else `appears_in 1 []`

				elem = 1
				lst = []
				[] is [] then return false
		`else find_first tail` mean take [2;3;2;4] and put it in as the next entry for `find_first`
		it2:
			head = [2]
			tail = [3;2;4]

	int = 2

I think you can see the pattern now. 

---

## Now Sum of Two as an example
```ocaml
let sumOfTwo (a, b, v) =
  let rec has_matching_sum elem_a list_b =
    match list_b with
    | [] -> false  
    | head :: tail ->
      if elem_a + head = v then true
      else has_matching_sum elem_a tail
  in
  
  let rec check_all_elements list_a =
    match list_a with
    | [] -> false
    | head :: tail ->
      if has_matching_sum head b then true
      else check_all_elements tail
  in
  check_all_elements a;;
```

### Example
	sumOfTwo([1;2;3],[10;20;30;40],42);;

### Logic
	`let rec check_all_elements list_a` will run first
	Base case `[] -> false` means no element in a yields a sum of v
	Recursive case `head :: tail`
		head = first element in list_a
		tail = the rest of the list
		it1:
			head = 1
			`has_matching_sum 1 [10;20;30;40]`:
				head = 10, tail = [20;30;40]
				1 + 10 = 11 != 42 -> recurse

				head = 20, tail = [30;40]
				1 + 20 = 21 != 42 -> recurse

				head = 30, tail = [40]
				1 + 30 = 31 != 42 -> recurse

				head = 40, tail = []
				1 + 40 = 41 != 42 -> recurse

				[] -> return false
			
			fallback to `check_all_element [2;3]`
		
		it2:
			head = 2
			`has_matching_sum 2 [10;20;30;40]`:
				head = 10, tail = [20;30;40]
				2 + 10 = 12 != 42 -> recurse

				head = 20, tail = [30;40]
				2 + 20 = 22 != 42 -> recurse

				head = 30, tail = [40]
				2 + 30 = 32 != 42 -> recurse

				head = 40, tail = []
				2 + 40 = 42 == 42 -> return true

			sumOfTwo returns true

	bool = true

---

## Now Frequency as an Example
```ocaml
let frequency list =
  let rec count_occurrences elem lst =
    match lst with
    | [] -> 0
    | head :: tail ->
        if head = elem then 1 + count_occurrences elem tail
        else count_occurrences elem tail
  in
  
  let rec exists_in elem lst =
    match lst with
    | [] -> false
    | head :: tail ->
        if head = elem then true 
        else exists_in elem tail
  in
  
  let rec build_result seen remaining =
    match remaining with
    | [] -> []
    | head :: tail ->
        if exists_in head seen then
          build_result seen tail
        else
          (head, count_occurrences head list)
          :: build_result (head :: seen) tail
  in 
  build_result [] list;;
```
`let frequency list` defines the function `frequency`, taking a list `list`.

`let rec count_occurrences elem lst`, `let rec exists_in elem lst`, and `let rec build_result seen remaining` are marked `rec` so they can call themselves.

`build_result [] list` is invoked last—so that’s the actual workhorse.

### Example
frequency ["a"; "a"; "a"; "b"; "b"; "c"; "c"; "c"; "c"];;

### Logic
	`build_result [] list` will run first
		Base case `[] -> []`: no more elements to process
		Recursive case `head :: tail`	
			if `head` is already seen, skip it and moves to the next element via `build_result seen tail`
			Otherwise, compute `count_occurrences head list`, pair it with `head`, and prepend to the result of `build_result (head :: seen) tail`

	it1:
		```ocaml
		build_result [] ["a"; "a"; "a"; "b"; "b"; "c"; "c"; "c"; "c"]
		seen = []
		remaining = head = "a", tail = ["a"; "a"; "b"; "b"; "c"; "c";"c"; "c"]
		exists_in "a" [] -> false
		```

		count_occurrences "a" ["a";"a";"a";"b";"b";"c";"c";"c";"c"]
			head = a == elem -> 1 + count_occurrences "a" ["a";"a";"b";…]

			head = a == elem → 1 + (1 + count_occurrences "a" ["a";"b";…])

			head = a  == elem → 1 + (1 + (1 + count_occurrences "a" ["b";…]))

			head = b != elem → count_occurrences "a" ["b"; "c";…]

			(Going through rest of list looking for matching head = a)
			heads "b","c","c","c","c" all ≠ → finally 0
			→ total = 1+1+1+0 = 3

	it2: 
		```ocaml
		build_result ["a"] ["a"; "a"; "b"; "b"; "c"; …]
		seen = ["a"]
		remaining = head = "a"
		exists_in "a" ["a"] -> checks head = "a" immediately -> true
		```

		Skip
		build_result ["a"] ["a"; "b"; "b"; "c"; …]
	
	it3: 	
		Same as it2 but the last "a" in the original list is checked
		build_result ["a"] ["b"; "b"; "c"; …]

	it4:
		```ocaml
		build_result ["a"] ["b"; "b"; "c"; "c"; "c"; "c"]
		head = "b",
		exists_in "b" ["a"] → check "a" != "b", then [] → false
		```
		elem = "b"
		count_occurrences "b" ["a";"a";"a";"b";"b";"c";…]
		head = "a" -> skip
		head = "a" -> skip
		head = "a" -> skip
		head = "b" = elem -> 1 + count_occurrences "b" ["b";"c";…]
		head = "b" = elem -> 1 + (1 + count_occurrences "b" ["c";…])
		heads "c","c","c","c" -> all skip -> 0 -> total = 2

	it5: 	
		```ocaml
		build_result ["b";"a"] ["b"; "c"; "c"; "c"; "c"]
		head = "b",
		exists_in "b" ["b";"a"] → head="b" → true
		Skip ->
		```
		build_result ["b";"a"] ["c"; "c"; "c"; "c"]

	it6:
		```ocaml
		build_result ["b";"a"] ["c"; "c"; "c"; "c"]
		head = "c",
		exists_in "c" ["b";"a"] -> check "b","a" -> false
		```
		
		elem = "c"
		count_occurrences "c" ["a";"a";"a";"b";"b";"c";"c";"c";"c"]
		first five heads != -> skip
		
	it7–it9
		Each remaining "c" is in seen = ["c";"b";"a"], so all three calls skip until:
			build_result ["c";"b";"a"] []
		
	Final step:
		build_result ["c";"b";"a"] []
			- where ["c";"b";"a"] is the `seen` list and `[]` is the remaining list
		Once `build_result [] []` returns [], each previous frame cons-es on its (head, count) pair, threading the list upward.

	(string * int) list = [("a", 3); ("b", 2); ("c", 4)]






---
