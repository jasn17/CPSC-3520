(* QUESTION 1 *)
let first_duplicate lst =
  (* Function to check if an element appears in a list *)
  let rec appears_in elem lst =
    match lst with
    (* Base case to check if the list is empty *)
    | [] -> false 
    (* Recursive case to check if the head of the list is equal to the element *)
    | head :: tail -> if head = elem then true else appears_in elem tail
  in
  
  (* Helper function to find the first element with a duplicate *)
  let rec find_first = function
    | [] -> -10000  (* Base case: no duplicates found *)
    | head :: tail -> 
      if appears_in head tail then head  (* Check if current element appears again *)
      else find_first tail  (* Continue with the rest of the list *)
  in
  find_first lst;;

first_duplicate [1;2;3;4;5;6;7;4;5;8;9];;
first_duplicate [1;2;3;4;5;6;7;8;5;2;9];;
first_duplicate [1;2;3;4;5;6;7;8;9;10];;

(* QUESTION 2 *)
let sumOfTwo (a, b, v) =
  (* Helper function that checks if any element in b can make the sum with a given element from a *)
  let rec has_matching_sum elem_a list_b =
    match list_b with
    | [] -> false  (* Reached end of list b with no match*)
    | head :: tail ->
      if elem_a + head = v then true  (* Pair matched *)
      else has_matching_sum elem_a tail  (* Checks the rest of list b *)
  in
  
  let rec check_all_elements list_a =
    match list_a with
    | [] -> false  (* Reached end of list a with no match*)
    | head :: tail ->
      if has_matching_sum head b then true  (* Current element has a match in b *)
      else check_all_elements tail
  in
  check_all_elements a;;

sumOfTwo([1;2;3],[10;20;30;40],42);;
sumOfTwo([1;2;3],[10;20;30;40],40);;
sumOfTwo([1;2;3],[10;20;30;40],41);;
sumOfTwo([1;2;3],[10;20;30;40],43);;
sumOfTwo([1;2;3],[10;20;30;40],44);;
sumOfTwo([1;2;3],[10;20;30;40],11);;
sumOfTwo([1;2;3],[10;20;30;40],15);;

(* QUESTION 3 *)
let frequency list =
  (*Helper function counting occurences of element*)
  let rec count_occurrences elem lst =
    match lst with
    | [] -> 0
    | head :: tail ->
        if head = elem then 1 + count_occurrences elem tail
        else count_occurrences elem tail
  in
  
  (* Helper function to check if an element exist in the rest of the list*)
  let rec exists_in elem lst =
    match lst with
    | [] -> false
    | head :: tail -> 
        if head = elem then true 
        else exists_in elem tail
  in
  
  (* Builds the resulting subset*)
  let rec build_result seen remaining =
    match remaining with
    | [] -> []
    | head :: tail ->
        if exists_in head seen then
          build_result seen tail
        else
          (head, count_occurrences head list) :: build_result (head :: seen) tail
  in
  build_result [] list;;

frequency ["a"; "a"; "a"; "b"; "b"; "c"; "c"; "c"; "c"];; 
frequency [1; 1; 2; 2; 2; 3; 4; 4];;


(* QUESTION 4 *)
let rec take (n, lst) =
  if n <= 0 then []  (* If negative return empty list *)
  else
    match lst with
    | [] -> []  (* Base case for enpty list*)
    | head :: tail -> head :: take (n - 1, tail);;

take (2, [1;2;3;4]);;
take (15, [1;2;3;4]);;
take (-1, [1;2;3;4]);;


(* QUESTION 5 *)
let rec add_to_all x lst =
  match lst with
  | [] -> []
  | head :: tail -> (x :: head) :: add_to_all x tail;;

let rec ps lst =
  match lst with
  | [] -> [[]] 
  | head :: tail -> 
      let rest_powerset = ps tail in
      List.append rest_powerset (add_to_all head rest_powerset);;

let powerset list = ps list;;

powerset [1;2;3];;
powerset [1;2];;
powerset [1;2;3;4];;
