reverse_number = (num) ->
  rev = 0
  while num > 0
    rev = rev * 10 + num % 10
    num = num // 10
  rev


is_palindrome = (number) ->
  number == reverse_number number


bounded_factors = (number, min, max) ->
  factors = {}
  limit = math.min(max, math.floor math.sqrt number)
  for f = min, limit
    g = number // f
    if f * g == number and g <= max
      table.insert factors, {f, g}
  factors


solve = (start, stop, step, min, max) ->
  assert min <= max, "min must be <= max"

  for product = start, stop, step
    if is_palindrome product
      fs = bounded_factors product, min, max
      if #fs > 0
        return {value: product, factors: fs}

  {value: nil, factors: {}}


{
  smallest: (min, max) ->
    result = solve min * min, max * max,  1, min, max
    result.value, result.factors

  largest:  (min, max) ->
    result = solve max * max, min * min, -1, min, max
    result.value, result.factors
}
