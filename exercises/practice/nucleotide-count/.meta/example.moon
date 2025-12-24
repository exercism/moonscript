return (strand) ->
  counts = A: 0, C: 0, G: 0, T: 0

  for char in strand\gmatch(".")
    error 'Invalid nucleotide in strand' unless counts[char]
    counts[char] += 1

  counts
