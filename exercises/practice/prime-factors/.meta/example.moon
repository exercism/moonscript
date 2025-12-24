{
  factors: (n) ->
    fs = {}
    f = 2
    while f * f <= n
      if n % f == 0
        n /= f
        table.insert fs, f
      else
        f += 1

    table.insert fs, n if n > 1
    fs
}
