(* 1. Write a function is_older that takes two dates and evaluates to true or false. It evaluates to true if
the first argument is a date that comes before the second argument. (If the two dates are the same, the result is false. *)
fun is_older(d1:  (int * int * int), d2:  (int * int * int)):bool = 
	let fun day_n(d:  (int * int * int)) = (#1 d) * 365 + (#2 d) * 31 + (#3 d)
	in day_n(d1) < day_n(d2)
	end

(* 2. Write a function number_in_month that takes a list of dates and a month (i.e., an int ) and returns
how many dates in the list are in the given month. *)
fun number_in_month(ds: (int * int * int) list, m:int):int = 
	if null ds then	0
	else
		if (#2 (hd ds)) = m then number_in_month((tl ds),m) + 1
		else number_in_month((tl ds),m);

(* 3. Write a function number_in_months that takes a list of dates and a list of months (i.e., an int list)
and returns the number of dates in the list of dates that are in any of the months in the list of months.
Assume the list of months has no number repeated.
Hint: Use your answer to the previous problem.*)
fun number_in_months(ds:  (int * int * int) list, ms: int list): int list =
	if null ms then [] 
	else number_in_month(ds, (hd ms))::number_in_months(ds, (tl ms));


(* 4. Write a function dates_in_month that takes a list of dates and a month (i.e., an int) and returns a
list holding the dates from the argument list of dates that are in the month. The returned list should
contain dates in the order they were originally given
*)
fun dates_in_month(ds:  (int * int * int) list, m: int):  (int * int * int) list = 
	if null ds then []
	else
		if (#2 (hd ds)) = m then (hd ds)::dates_in_month((tl ds), m)
		else dates_in_month((tl ds),m);

(* 5.Write a function dates_in_months that takes a list of dates and a list of months (i.e., a int list )
and returns a list holding the dates from the argument list of dates that are in any of the months in the list of months.
Assume the list of months has no number repeated. Hint: Use your answer to the previous problem and SML's list-append operator
*)
fun dates_in_months(ds:  (int * int * int) list, ms: int list):  (int * int * int) list =
	if null ms then []
	else dates_in_month(ds, (hd ms)) @ dates_in_months(ds, (tl ms));


(* 6.Write a function get_nth that takes a list of strings and an int n and returns the n th element of the list where the head of the list is 1 st
. Do not worry about the case where the list has too few elements: your function may apply hd or tl to the empty list in this case, which is okay
*)
fun get_nth (ss: string list, n: int): string =
	if n = 1 then hd ss
	else get_nth(tl ss, n-1); 

(* 7.  Write a function date_to_string that takes a date and returns a string of the form January 20, 2013 (for example). Use the operator
^ for concatenating strings and the library function Int.toString for converting an int to a string. For producing the month part, do
not use a bunch of conditionals. Instead, use a list holding 12 strings and your answer to the previous problem. For consistency, put a
comma following the day and use capitalized English month names: January, February, March, April,
May, June, July, August, September, October, November, December.*)
fun date_to_string(d: (int * int * int)): string = 
	let
		val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
		fun i_t_m(i:int, ms: string list): string = 
			if i = 0 then hd ms else i_t_m(i-1, tl ms);
	in i_t_m((#2 d)-1, months) ^ " " ^ Int.toString(#3 d) ^ ", " ^ Int.toString(#1 d)
	end
	 
	 
(* 8. Write a function number_before_reaching_sum that takes an int called sum, which you can assume is positive, and an int list
, which you can assume contains all positive numbers, and returns an int. You should return an int n such that the rst
n elements of the list add to less than sum, but the rst n + 1 elements of the list add to sum or more.
Assume the entire list sums to more than the passed in value; it is okay for an exception to occur if this is not the case.*)
fun number_before_reaching_sum(max: int, is: int list): int =
	let fun number_before_reaching_sum_i(max: int, is: int list, cs: int, n:int): int =
			if (hd is) + cs >= max then n
			else number_before_reaching_sum_i(max, tl is, (hd is) + cs, n + 1)
 	in number_before_reaching_sum_i(max, is, 0, 0)
 	end;

(* 9. Write a function what_month that takes a day of year (i.e., an int between 1 awhat_month(nd 365) and returns
what month that day is in (1 for January, 2 for February, etc.). Use a list holding 12 integers and your answer to the previous problem. *)

fun what_month(d: int): int = number_before_reaching_sum(d, [31,28,31,30,31,30,31,31,30,31,30,31]) + 1
	
(* 10. Write a function month_range that takes two days of the year day1 and day2 and returns an int list
[m1,m2,...,mn] where m1 is the month of day1, m2 is the month of day1+1, ..., and mn is the month
of day day2. Note the result will have length day2 - day1 + 1 or length 0 if day1>day2 .*)
fun month_range(d1: int, d2: int): int list =
	if d2 < d1 then []
	else if d2 = d1 then [what_month d1]
	else month_range(d1, d2-1) @ [what_month(d2)];
	
(* 11. Write a function oldest that takes a list of dates and evaluates to an (int*int*int) option. It evaluates to
NONE if the list has no dates and SOME d if the date d is the oldest date in the list.*)
fun oldest(ds:  (int * int * int) list):  (int * int * int) option =
	let fun oldest_from(ds:  (int * int * int) list, co:  (int * int * int) option):  (int * int * int) option =
		if null ds then co
		else
			if isSome co then
				if is_older(hd ds, valOf co) then oldest_from(tl ds, SOME(hd ds))
					else oldest_from(tl ds, co)
			else oldest_from(tl ds, SOME(hd ds))
	in oldest_from(ds, NONE)
	end;

	
	
			
	