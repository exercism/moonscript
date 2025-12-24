{
  sum: (factors, limit) ->
    sum = 0
    for n = 1, limit - 1
      for f in *factors
        continue if f == 0
        if n % f == 0
          sum += n
          break
    sum
}
