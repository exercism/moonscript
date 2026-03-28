pad = (str, width) -> string.format "%-#{width}s", str

join = table.concat

encode = (text) ->
  clean = text\gsub('[^%a%d]', '')\lower!
  return '' if clean == ''
  len = math.ceil math.sqrt #clean

  segments = {}
  for i = 1, #clean, len
    table.insert segments, clean\sub(i, i + len - 1)

  -- pad the last segment
  segments[#segments] = pad segments[#segments], len

  transposed = [join [s\sub(i,i) for s in *segments] for i = 1, len]
  join transposed, " "


{ :encode }
