{
  rows: (letter) ->
    return {'A'} if letter == 'A'

    first = string.byte 'A'
    last = string.byte letter
    lines = last - first + 1
    diamond = {}

    for i = 0, lines - 1
      symbol = string.char first + i
      outerPadding = string.rep ' ', lines - 1 - i
      line = if i == 0
        outerPadding .. symbol .. outerPadding
      else
        innerPadding = string.rep ' ', 2 * i - 1
        outerPadding .. symbol .. innerPadding .. symbol .. outerPadding
      table.insert diamond, line

    -- flip the diamond
    for i = lines - 1, 1, -1
      table.insert diamond, diamond[i]

    diamond
}
