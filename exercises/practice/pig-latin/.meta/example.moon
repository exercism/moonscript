vowels = 'AaEeIiOoUu'
vowel = "[#{vowels}]"
consonant = "[^#{vowels}]"

patterns = {
  vowel: {
    "^#{vowel}",
    '^[Xx][Rr]',
    '^[Yy][Tt]',
  },
  consonant: {
    "^(#{consonant}*[Qq][Uu])(.*)",
    "^(#{consonant}+)([Yy].*)",
    "^(#{consonant}+)(.*)",
  }
}


translate_word = (word) ->
  for patt in *patterns.vowel
    if word\find patt
      return word .. 'ay'

  for patt in *patterns.consonant
    first, rest = word\match patt
    if first and rest
      return rest .. first .. 'ay'

  return word .. 'ay'


translate = (phrase) ->
  table.concat [translate_word word for word in phrase\gmatch('[^%s]+')], ' '

{ :translate }
