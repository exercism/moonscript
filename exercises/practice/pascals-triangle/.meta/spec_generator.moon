int_list = (list) -> "{#{table.concat list, ', '}}"

int_lists = (lists, level) ->
  if #lists == 0
    '{}'
  elseif #lists == 1
    "{#{int_list lists[1]}}"
  else
    rows = [indent int_list(row) .. ',', level + 1 for row in *lists]
    table.insert rows, 1, '{'
    table.insert rows, indent '}', level
    table.concat rows, '\n'


{
  module_name: 'PascalsTriangle',

  generate_test: (case, level) ->
    lines = {
      "result = PascalsTriangle.#{case.property} #{case.input.count}",
      "expected = #{int_lists case.expected, level}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
