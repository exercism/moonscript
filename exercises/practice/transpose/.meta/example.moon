is_empty = (t) -> not next t

pad_end = (str, wid) -> string.format "%-#{wid}s", str

trim_end = (str) -> str\gsub '%s+$', ''

{
  transpose: (input) ->
    return {} if is_empty input

    max = math.max table.unpack [#line for line in *input]
    padded = [pad_end line, max for line in *input]

    transposed = {}
    for i = 1, #padded[1]
      row = [line\sub i, i for line in *padded]
      line = trim_end table.concat(row, '')
      table.insert transposed, line

    wid = #transposed[#transposed]
    for i = #transposed - 1, 1, -1
      if #transposed[i] < wid
        transposed[i] = pad_end transposed[i], wid
      else
        wid = #transposed[i]

    transposed
}
