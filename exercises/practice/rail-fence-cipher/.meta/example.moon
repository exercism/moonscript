rail_iter = (n) ->
  coroutine.wrap ->
    while true
      coroutine.yield i for i = 1, n-1
      coroutine.yield i for i = n, 2, -1

{
  encode: (n, plaintext) ->
    rails = [{} for _ = 1, n]
    next_rail = rail_iter n
    for char in plaintext\gmatch '.'
      r = next_rail!
      table.insert rails[r], char

    table.concat [table.concat rail for rail in *rails]

  decode: (n, ciphertext) ->
    len = #ciphertext

    -- find the length of each rail
    cycle_length = 2*(n - 1)
    cycles = len // cycle_length
    lengths = [cycles * ((i == 1 or i == n) and 1 or 2) for i = 1, n]
    -- account for the last partial cycle
    next_rail = rail_iter n
    for i = 1, len - cycles * cycle_length
      lengths[next_rail!] += 1

    -- extract the rails from the ciphertext
    rails = {}
    start = 1
    for r = 1, n
      chunk = ciphertext\sub start, start + lengths[r] - 1
      rails[r] = [c for c in chunk\gmatch '.']
      start += lengths[r]

    next_rail = rail_iter n
    table.concat [table.remove rails[next_rail!], 1 for _ = 1, len]
}
