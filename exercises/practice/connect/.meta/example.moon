-- ---------------------------------------------------
clone = (t) -> [ [c for c in *row] for row in *t]
transpose = (t) ->
  [ [t[row][col] for row = 1, #t] for col = 1, #t[1]]

-- ---------------------------------------------------
win = (player, mtx) ->
  size = #mtx -- assume square board

  -- seed the stack with players on the first row
  stack = [{1, i} for i = 1, size when mtx[1][i] == player]
  return false if #stack == 0
  return true if size == 1

  neighbours = (r, c) ->
    ns = {}
    for {dr, dc} in *{{-1,0}, {-1,1}, {0,-1}, {0,1}, {1,-1}, {1,0}}
      rr, cc = r + dr, c + dc
      if rr >= 1 and rr <= size and cc >= 1 and cc <= size
        table.insert ns, {rr, cc} if mtx[rr][cc] == player
    ns

  while #stack > 0
    {r, c} = table.remove stack
    for {rr, cc} in *neighbours r, c
      return true if rr == size -- winner reached the last row
      mtx[rr][cc] = '-' -- mark as visited
      table.insert stack, {rr, cc}
  false

-- ---------------------------------------------------
{
  winner: (board) ->
    matrix = [ [c for c in row\gmatch '[XO.]'] for row in *board]
    return 'O' if win 'O', clone(matrix)      -- top to bottom
    return 'X' if win 'X', transpose(matrix)  -- left to right
    return ''
}
