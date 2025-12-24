return (num) ->
  count = 0
  while num > 0
    count += num & 1
    num >>= 1
  count
