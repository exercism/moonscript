actions = {'wink', 'double blink', 'close your eyes', 'jump'}
      
-- reverse a table _in-place_
treverse = (t) ->
  i, j = 1, #t
  while i < j
    t[i], t[j] = t[j], t[i]
    i += 1
    j -= 1

{
  commands: (value) ->
    return {} unless value > 0
    result = [a for i, a in ipairs actions when (value >> (i-1)) & 1 == 1]
    treverse result if (value >> #actions) & 1 == 1
    result
}

