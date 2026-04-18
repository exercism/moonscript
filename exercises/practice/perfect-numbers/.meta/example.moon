import fold from require 'moon'

aliquot_sum = (number) ->
  factors = {}
  f = 1
  while f * f <= number
    g = number // f
    if g * f == number
      table.insert factors, f
      if g != f
        table.insert factors, g
    f += 1
  -- the sum of the factors not including the number
  fold(factors, (sum, num) -> sum + num) - number

{
  classify: (number) ->
    assert number > 0, 'Classification is only possible for positive integers.'

    sum = aliquot_sum number
    if sum == number
      'perfect'
    elseif sum < number
      'deficient'
    else
      'abundant'
}

