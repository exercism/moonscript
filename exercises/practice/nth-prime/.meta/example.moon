-- a coroutine wrapped up in a closure
prime_generator = ->
  primes = {}

  is_prime = (n) ->
    sqrt = math.sqrt n
    for p in *primes
      return true if p > sqrt
      return false if n % p == 0
    true

  coroutine.wrap ->
    coroutine.yield 2
    table.insert primes, 2
    p = 3
    while true
      coroutine.yield p
      table.insert primes, p
      incrementing = true
      while incrementing
        p += 2
        incrementing = not is_prime p


nth_prime = (n) ->
  assert n > 0, 'there is no zeroth prime'

  next_prime = prime_generator!
  i = 0

  while true
    prime = next_prime!
    i += 1
    return prime if i == n


{ prime: nth_prime }
