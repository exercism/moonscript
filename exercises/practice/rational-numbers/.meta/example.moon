-- math functions
import abs from require 'math'
gcd = (a, b) -> b == 0 and a or gcd b, a % b

-- rational functions and helpers
reduce = (r) ->
  {a, b} = r
  return {0, 1} if a == 0
  if b < 0
    a, b = -a, -b
  g = gcd a, b
  {a / g, b / g}

add = (r1, r2) ->
  {a, b}, {c, d} = r1, r2
  reduce {a * d + c * b, b * d}

mul = (r1, r2) ->
  {a, b}, {c, d} = r1, r2
  reduce {a * c, b * d}

negate = (r) ->
  {a, b} = r
  {-a, b}

invert = (r) ->
  {a, b} = r
  {b, a}

-- --------------------------------------------------------
{
  :reduce
  :add
  :mul

  sub: (r1, r2) -> add r1, negate r2
  div: (r1, r2) -> mul r1, invert r2

  abs: (r) ->
    {a, b} = r
    reduce {abs(a), abs(b)}

  exprational: (r, n) ->
    {a, b} = r
    if n < 0
      n, {a, b} = -n, {b, a}
    reduce {a ^ n, b ^ n}

  expreal: (x, r) ->
    {a, b} = r
    x ^ (a / b)
}
