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

## Example
frequency ["a"; "a"; "a"; "b"; "b"; "c"; "c"; "c"; "c"];;

---

