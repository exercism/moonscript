-- a cornucopia of list comprehensions

split = (str, delim) ->
  pattern = '[^' .. delim .. ']+'
  [word for word in str\gmatch pattern]

tomatrix = (str) ->
  [ [tonumber word for word in *(split line, ' ')] for line in *(split str, '\n')]

{
  row: (str, idx) -> (tomatrix str)[idx]

  column: (str, idx) -> [row[idx] for row in *(tomatrix str)]
}
