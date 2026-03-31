-- https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle#Modern_method
table.shuffle = (t) ->
  for i = #t, 2, -1
    j = math.random i
    t[i], t[j] = t[j], t[i]


-- Generate all the names
NAMES = [string.format '%c%c%03d', a, b, c for a = 65,90 for b = 65,90 for c = 0,999]
table.shuffle NAMES


class Robot
  @idx: 0

  @reset_names: =>
    @idx = 0

  new: =>
    @reset!
  
  reset: =>
    @@idx += 1
    assert @@idx <= #NAMES, 'all names taken'
    @_name = NAMES[@@idx]

  name: => @_name
