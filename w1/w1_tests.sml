use "w1_solutions.sml";

val test_1_is_older = is_older((2016,3,1),(2016,2,2))

val test_2_number_in_month = number_in_month ([(1,0,3),(1,2,3),(1,0,3),(1,2,3)], 2)

val test_3_number_in_months = number_in_months ([(1,1,1),(2,2,2),(1,2,1)],[1,2,3])

val test_4_dates_in_month = dates_in_month([(1,1,1),(1,2,1),(3,1,1)],1)

val test_5_dates_in_months = dates_in_months([(1,1,1),(1,2,2),(1,3,2)],[1,2])

val test_6_get_nth = get_nth(["1","2","3"],1)

val test_7_date_to_string = date_to_string(1970,1,1)

val test_8_number_before_reaching_sum = number_before_reaching_sum([1,2,3,4,5,6,7],7)

val test_9_what_month_1 = what_month(30)
val test_9_what_month_2 = what_month(45)

val test_10_month_range = month_range(28,34)

val test_11_oldest = oldest([(1,1,1),(3,3,3),(2,2,2)]);


