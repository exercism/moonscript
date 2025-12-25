{
  primes: (limit) ->
    flags = [true for _ = 1, limit]
    flags[1] = false

    for i = 2, math.floor(math.sqrt limit)
      if flags[i]
        for j = i * i, limit, i
          flags[j] = false

    [i for i = 2, limit when flags[i]]
}
