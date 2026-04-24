Deltas = {
  {-1, -1}, {-1, 0}, {-1, 1},
  {0, -1},           {0, 1},
  {1, -1},  {1, 0},  {1, 1}
}

tick = (matrix) ->
  height = #matrix
  return {} if height == 0
  width = #matrix[1]

  count_neighbours = (x, y) ->
    count = 0
    for d in *Deltas
      dx, dy = x + d[1], y + d[2]
      if 1 <= dx and dx <= height and 1 <= dy and dy <= width
        count += matrix[dx][dy]
    count

  result = [{} for _ = 1, height]
  for r = 1, height
    for c = 1, width
      result[r][c] = switch count_neighbours r, c
        when 3 then 1
        when 2 then matrix[r][c]
        else 0
  result


{ :tick }
