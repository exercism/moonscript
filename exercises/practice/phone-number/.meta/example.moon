clean = (input) ->
  -- remove valid non-digits
  cleaned = input\gsub '[%s().+-]', ''

  if #cleaned == 11
    assert cleaned\sub(1,1) == '1', '11 digits must start with 1'
    cleaned = cleaned\sub(2)

  assert #cleaned >  9, 'must not be fewer than 10 digits'
  assert #cleaned < 11, 'must not be greater than 11 digits'
  assert not cleaned\match('%a'), 'letters not permitted'
  assert not cleaned\match('%D'), 'punctuations not permitted'
  assert cleaned\sub(1,1) != '0', 'area code cannot start with zero'
  assert cleaned\sub(1,1) != '1', 'area code cannot start with one'
  assert cleaned\sub(4,4) != '0', 'exchange code cannot start with zero'
  assert cleaned\sub(4,4) != '1', 'exchange code cannot start with one'

  cleaned


{ :clean }
