{
  is_isogram: (phrase) ->
    seen = {}
    for char in phrase\upper!\gmatch '%a'
      return false if seen[char]
      seen[char] = true
    true
}
