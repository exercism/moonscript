KEY_CHARS = [c for c in 'abcdefghijklmnopqrstuvwxyz'\gmatch '.']
A = string.byte 'a'
INDEX = {c, string.byte(c) - A for c in *KEY_CHARS}

randomKey = ->
  table.concat [KEY_CHARS[math.random #KEY_CHARS] for _ = 1, 100]

class SimpleCipher
  new: (key) =>
    @Key = key or randomKey!

  key: => @Key

  encipher: (text, direction) =>
    while #@Key < #text
      @Key ..= @Key

    idx = 0
    text\gsub '.', (char) ->
      idx += 1
      t = INDEX[char]
      k = INDEX[@Key\sub idx, idx]
      i = (t + direction * k) % #KEY_CHARS + 1
      KEY_CHARS[i]

  encode: (text) => @encipher text, 1
  decode: (text) => @encipher text, -1
