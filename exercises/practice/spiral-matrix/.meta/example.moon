{
  spiral_matrix: (size) ->
    mtx = [ [nil for _ = 1, size] for _ = 1, size]
    x, y = 1, 1
    dx, dy = 0, 1

    outside = (n) -> n < 1 or n > size
    turn = -> dx, dy = dy, -dx

    for i = 1, size*size
      mtx[x][y] = i
      turn! if outside(x + dx) or outside(y + dy) or mtx[x + dx][y + dy]
      x += dx
      y += dy

    mtx
}
