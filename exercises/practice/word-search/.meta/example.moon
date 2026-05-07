class WordSearch
  new: (grid) =>
    @matrix = [ [c for c in row\gmatch '.'] for row in *grid]
    @height = #@matrix
    @width = #@matrix[1]

  find: (words) => {word, @findWord word for word in *words}

  findWord: (word) =>
    for row = 1, @height
      for col = 1, @width
        if @matrix[row][col] == word\sub 1,1
          first = {row: row, column: col}
          for dr = -1, 1
            for dc = -1, 1
              continue if dr == 0 and dc == 0
              last = @findInDirection row, col, dr, dc, word
              if last
                return {start: first, end: last}
    nil

  findInDirection: (row, col, dr, dc, word) =>
    local rr, cc
    for i = 1, #word
      rr = row + (i - 1) * dr
      cc = col + (i - 1) * dc
      return nil if rr < 1 or rr > @height or cc < 1 or cc > @width
      return nil if @matrix[rr][cc] != word\sub i,i
    return {row: rr, column: cc}
