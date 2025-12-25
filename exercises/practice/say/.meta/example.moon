WORDS = {
    [0]: 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven',
    'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen',
    'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen', 'twenty',
    [30]: 'thirty',  [40]: 'forty',  [50]: 'fifty', [60]: 'sixty',
    [70]: 'seventy', [80]: 'eighty', [90]: 'ninety',
}


say_small = (n) -> WORDS[n] or "#{WORDS[n - n % 10]}-#{WORDS[n % 10]}"

local in_english

say_compound = (n, base, unit) ->
  quotient, remainder = n // base, n % base
  saying = "#{in_english quotient} #{unit}"
  saying ..= " #{in_english remainder}" if remainder > 0
  saying


in_english = (n) ->
  assert 0 <= n and n < 1e12, 'input out of range'

  if     n < 100 then say_small n
  elseif n < 1e3 then say_compound n, 100, 'hundred'
  elseif n < 1e6 then say_compound n, 1e3, 'thousand'
  elseif n < 1e9 then say_compound n, 1e6, 'million'
  else                say_compound n, 1e9, 'billion'


{ :in_english }
