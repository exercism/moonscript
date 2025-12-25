int_list = (list) -> "{#{table.concat list, ', '}}"

int_lists = (lists, level) ->
  if #lists == 1
    "{#{int_list lists[1]}}"
  else
    rows = [indent int_list(row) .. ',', level + 1 for row in *lists]
    table.insert rows, 1, '{'
    table.insert rows, indent '}', level
    table.concat rows, '\n'

result_obj = (obj) -> "{row: #{obj.row}, column: #{obj.column}}"
result_list = (list) -> "{#{table.concat [result_obj obj for obj in *list], ', '}}"

{
  module_imports: {'saddle_points'},

  test_helpers: [[
  cmp_saddle_points = (a, b) ->
    a.row < b.row or (a.row == b.row and a.column < b.column)
]]

  generate_test: (case, level) ->
    lines = {
      "matrix = #{int_lists case.input.matrix, level}",
      "result = saddle_points matrix"
      "expected = #{result_list case.expected}",
      "table.sort result, cmp_saddle_points",
      "table.sort expected, cmp_saddle_points",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
