{
  truncate: (str, size=5) ->
    codepoints = { utf8.codepoint str, 1, #str }
    utf8.char(table.unpack [cp for cp in *codepoints[,size]])
}
