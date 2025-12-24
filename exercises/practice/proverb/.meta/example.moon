return (items) ->
  return '' if #items == 0

  forwant = (i) -> "For want of a #{items[i]} the #{items[i + 1]} was lost.\n"
  andall = -> "And all for the want of a #{items[1]}.\n"

  lines = [forwant i for i = 1, #items - 1]
  table.insert lines, andall!
  table.concat lines
