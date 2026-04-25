re = require 're'       -- https://www.inf.puc-rio.br/~roberto/lpeg/re.html

local err, evaluate

answer = (input) ->
  wordy = re.compile [[
    wordy <- 'What is ' {| expr |} '?'
    expr <- { num } (s {~ op ~} s { num })*
    num <- '-'? %d+
    op <- 'plus' -> '+'
        / 'minus' -> '-'
        / 'multiplied by' -> '*'
        / 'divided by' -> '/'
    s <- %s+
  ]]

  tokens = re.match input, wordy
  if tokens
    evaluate tokens
  else
    err input

evaluate = (tokens) ->
  result = tonumber tokens[1]
  for i = 2, #tokens, 2
    addend = tonumber tokens[i+1]
    result = switch tokens[i]
      when '+' then result + addend
      when '-' then result - addend
      when '*' then result * addend
      when '/' then result // addend
  result

err = (input) ->
  refute = (cond, msg) -> assert not cond, msg

  -- figure out the appropriate error message
  refute input\match('^What is *%?$'), 'syntax error'
  assert input\match('^What is .+%?$'), 'unknown operation'
  syntax_errs = re.compile [[
    x <- s (op s op / num s num / op '?')
    op <- 'plus' / 'minus' / 'multiplied by' / 'divided by'
    num <- '-'? %d+
    s <- %s+
  ]]
  refute re.find(input, syntax_errs), 'syntax error'
  error 'unknown operation'

{ :answer }
