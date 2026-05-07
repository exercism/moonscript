List = require 'pl.List'

combinations = (input) ->
  {:sum, :size, :exclude} = input
  exclude = List exclude

  if size == 1
    if 1 <= sum and sum <= 9 and not exclude\contains sum
      return List {List {sum}}
    else
      return {}
  
  result = List!
  for n = 1, 9
    if not exclude\contains n
      for c in *combinations {
        sum: sum - n,
        size: size - 1,
        exclude: exclude\append n 
      }
        combo = c\append(n)\sort!
        if not result\contains combo
          result\append combo 
  result

{ :combinations }
