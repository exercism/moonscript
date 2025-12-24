leap_year = (year) ->
  is_divisible_by = (num) -> year % num == 0

  (is_divisible_by 4) and (not is_divisible_by 100)  or (is_divisible_by 400)

return leap_year
