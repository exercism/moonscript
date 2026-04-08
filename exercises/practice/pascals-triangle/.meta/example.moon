FACTORIALS = {[0]: 1, [1]: 1}

factorial = (n) ->
  if not FACTORIALS[n]
    FACTORIALS[n] = n * factorial(n - 1)
  FACTORIALS[n]

choose = (n, k) ->
  factorial(n) // factorial(k) // factorial(n - k)

{
  rows: (n) ->
    [ [choose(i, j) for j = 0, i] for i = 0, n - 1]
}
