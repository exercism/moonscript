contains = (vertices, vertex) ->
  for v in *vertices
    return true if v == vertex
  false

-- ----------------------------------------
class Vertex
  new: (@row, @col) =>
  __eq: (other) => @row == other.row and @col == other.col

vertices = (input) ->
  [Vertex row, col for row = 1, #input for col = 1, #input[1] when input[row][col] == '+']

verticesRightOf = (vertex, vertices) ->
  [v for v in *vertices when v.row == vertex.row and v.col > vertex.col]

verticesBelow = (vertex, vertices) ->
  [v for v in *vertices when v.col == vertex.col and v.row > vertex.row]

-- ----------------------------------------
isRectangle = (input, topLeft, topRight, bottomLeft, bottomRight) ->
  horizontalLine = (left, right) ->
    for col = left.col + 1, right.col - 1
      return false if not (input[left.row][col] == '-' or input[left.row][col] == '+')
    true

  verticalLine = (top, bottom) ->
    for row = top.row + 1, bottom.row - 1
      return false if not (input[row][top.col] == '|' or input[row][top.col] == '+')
    true

  return false if not horizontalLine topLeft, topRight
  return false if not horizontalLine bottomLeft, bottomRight
  return false if not verticalLine topLeft, bottomLeft
  return false if not verticalLine topRight, bottomRight
  true

-- ----------------------------------------
rectangles = (input) ->
  input = [ [c for c in line\gmatch '.'] for line in *input]
  vs = vertices input
  count = 0
  for topLeft in *vs
    for topRight in *verticesRightOf topLeft, vs
      for bottomLeft in *verticesBelow topLeft, vs
        bottomRight = Vertex bottomLeft.row, topRight.col
        if contains vs, bottomRight
          if isRectangle input, topLeft, topRight, bottomLeft, bottomRight
            count += 1
  count

{ :rectangles }
