doubled = {
  [false]: {[0]: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
  [true]:  {[0]: 0, 2, 4, 6, 8, 1, 3, 5, 7, 9},
}

{
  is_valid: (input) ->
    stripped = input\gsub '%s', ''
    return false if #stripped < 2

    double = false
    sum = 0

    for i = #stripped, 1, -1
      digit = tonumber stripped\sub(i, i)
      return false if not digit
      sum += doubled[double][digit]
      double = not double

    sum % 10 == 0
}

