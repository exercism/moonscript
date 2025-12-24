armstrong_sum = (n) ->
  width = #tostring(n)
  sum = 0
  while n > 0
    sum += (n % 10) ^ width
    n = n // 10
  sum

is_armstrong = (n) -> n == armstrong_sum n

{ :is_armstrong }
