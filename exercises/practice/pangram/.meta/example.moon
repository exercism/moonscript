return (str) ->
  seen = {}
  count = 0
  for char in str\lower!\gmatch("[a-z]")
    if not seen[char]
      seen[char] = 1
      count += 1
      return true if count == 26
  false
