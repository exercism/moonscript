distance = (strand1, strand2) ->
  assert #strand1 == #strand2, 'strands must be of equal length'

  count = 0
  for i = 1, #strand1
    count += 1 if strand1\sub(i, i) != strand2\sub(i, i)
  count

{ :distance }
