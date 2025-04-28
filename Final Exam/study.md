# OCAML (And how it works)

Take first duplicate for example: 
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
## Example
	first_duplicate [1;2;3;2;4];;
## Logic
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



