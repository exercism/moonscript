trim = (str) -> str\gsub("^'+", '')\gsub("'+$", '')

{
  count_words: (sentence) ->
    result = {}
    for word in sentence\lower!\gmatch("[%w+']+")
      w = trim word
      result[w] = (result[w] or 0) + 1
    result
}
