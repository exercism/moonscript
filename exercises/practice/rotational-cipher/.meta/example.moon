{
  rotate: (text, shift_key) ->
    text\gsub '.', (char) ->
      byte = string.byte char
      if byte >= 97 and byte <= 122
        string.char (byte - 97 + shift_key) % 26 + 97
      elseif byte >= 65 and byte <= 90
        string.char (byte - 65 + shift_key) % 26 + 65
      else
        char
}
