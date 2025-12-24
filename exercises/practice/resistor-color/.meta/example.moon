resistor_colors = {'black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white'}

color_code = (color) ->
  for i, c in ipairs resistor_colors
    if c == color
      return i - 1
  return -1

colors = -> resistor_colors

{ :colors, :color_code }
