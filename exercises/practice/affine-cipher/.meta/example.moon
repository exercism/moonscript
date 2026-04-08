M = 26  -- size of alphabet

gcd = (a, b) ->
  while b != 0
    a, b = b, a % b
  a

mmi = (a, m) ->
  for x = 1, m
    return x if (a * x) % m == 1
  error 'should not happen: cannot determine MMI of #{a} and #{m}'

ord = (letter) -> letter\byte!
chr = (number) -> string.char number
A = ord 'a'

validate = (a, m) ->
  assert gcd(a, m) == 1, 'a and m must be coprime.'

add_spaces = (str, n = 5) ->
  str\gsub('.'\rep(n), '%0 ')\gsub(' $', '')

encipher = (text, func) ->
  encipherer = (c) -> c\match('%d') and c or chr(A + func(ord(c) - A))
  table.concat [encipherer c for c in text\lower!\gmatch '%w']


{
  encode: (phrase, key) ->
    validate key.a, M
    encoder = (x) -> (key.a * x + key.b) % M
    add_spaces encipher(phrase, encoder)

  decode: (phrase, key) ->
    validate key.a, M
    a_prime = mmi key.a, M
    decoder = (y) -> (a_prime * (y - key.b)) % M
    encipher(phrase, decoder)
}
