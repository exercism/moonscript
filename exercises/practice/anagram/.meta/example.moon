sort_word = (word) ->
  chars = [c for c in word\gmatch('.')]
  table.sort chars
  table.concat chars


return (subject, candidates) ->
  lc = subject\lower!
  key = sort_word lc

  is_anagram = (word) -> lc != word and key == sort_word word

  [c for c in *candidates when is_anagram c\lower!]
