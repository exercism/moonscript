collatz_steps = (n) ->
  assert n > 0, 'Only positive integers are allowed'

  steps = 0
  while n > 1
    if n & 1 == 0
      n >>= 1
    else
      n = 3 * n + 1
    steps += 1

  steps

{ steps: collatz_steps }
