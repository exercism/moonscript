int_list = (list) -> "{#{table.concat list, ', '}}"

int_lists = (list, level) ->
  switch #list
    when 0 then '{}'
    when 1 then '{{1}}'
    else
      rows = [indent int_list(row), level + 1 for row in *list]
      table.insert rows, 1, '{'
      table.insert rows, indent('}', level)
      table.concat rows, '\n'

{
  module_imports: {'spiral_matrix'},

  generate_test: (case, level) ->
    lines = {
      "result = spiral_matrix #{case.input.size}",
      "expected = #{int_lists case.expected, level}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
