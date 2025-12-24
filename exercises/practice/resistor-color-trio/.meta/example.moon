resistor_colors = {'black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white'}

color_code = (color) ->
  for i, c in ipairs resistor_colors
    if c == color
      return i - 1
  return -1

value = (first, second) -> 10 * color_code(first) + color_code(second)

prefixes = {'', 'kilo', 'mega', 'giga'}

{
  label: (c1, c2, c3, ...) ->
    resistance = value(c1, c2) * math.tointeger(10 ^ color_code c3)

    idx = 1
    while resistance > 0 and resistance % 1000 == 0
      idx += 1
      resistance = resistance // 1000

    "#{resistance} #{prefixes[idx]}ohms"
}
