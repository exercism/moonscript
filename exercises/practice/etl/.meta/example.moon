{
  transform: (legacy) ->
    result = {}
    for score, letters in pairs legacy
      for letter in *letters
        result[letter\lower!] = tonumber(score)
    result
}
