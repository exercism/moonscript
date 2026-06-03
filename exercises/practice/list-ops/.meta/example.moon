-- The first 3 functions require Lua/MoonScript builtin table functions

append = (list1, list2) ->
  result = {table.unpack list1}
  table.insert result, elem for elem in *list2
  result

foldl = (list, acc, fn) ->
  for elem in *list
    acc = fn acc, elem
  acc

reverse = (list) ->
  foldl list, {}, (acc, el) ->
    table.insert acc, 1, el
    acc

-- All the rest can just use the above functions

length = (list) -> foldl list, 0, (acc, _) -> acc + 1

concat = (list) -> foldl list, {}, (acc, el) -> append acc, el

map = (list, fn) -> foldl list, {}, (acc, el) -> append acc, {fn el}

filter = (list, fn) ->
  foldl list, {}, (acc, el) ->
    if fn el
      acc = append acc, {el}
    acc

foldr = (list, acc, fn) -> foldl reverse(list), acc, fn

{
  :append
  :concat
  :filter
  :length
  :map
  :foldl
  :foldr
  :reverse
}
