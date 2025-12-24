class Queen
  new: (row, column) =>
    error 'invalid position' unless 0 <= row and row < 8 and 0 <= column and column < 8
    @row, @col = row, column

  can_attack: (other) =>
    dr = math.abs @row - other.row
    dc = math.abs @col - other.col
    dr == 0 or dc == 0 or dr == dc
