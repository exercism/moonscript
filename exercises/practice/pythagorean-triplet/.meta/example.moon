{
  triplets_with_sum: (n) ->
    triplets = {}
    a = 0
    while true
      a += 1
      b = n * (n - 2 * a) / (2 * (n - a))
      break if b < a
      if b == math.tointeger b
        c = n - a - b
        table.insert triplets, {a, b, c}
    triplets
}
