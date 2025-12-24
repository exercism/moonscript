return (str) ->
  rev = ""
  for _, code in utf8.codes(str)
    rev = utf8.char(code) .. rev
  rev
