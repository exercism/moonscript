is_valid = (...) ->
  sides = {...}
  table.sort sides
  sides[1] > 0 and sides[1] + sides[2] > sides[3]


is_equilateral = (a, b, c) ->
  return false unless is_valid(a, b, c)
  a == b and b == c


is_isosceles = (a, b, c) ->
  return false unless is_valid(a, b, c)
  a == b or b == c or c == a


is_scalene = (a, b, c) ->
  return false unless is_valid(a, b, c)
  not (a == b or b == c or c == a)


{ :is_equilateral, :is_isosceles, :is_scalene }
