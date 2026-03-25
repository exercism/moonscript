int_list = (list) -> "{#{table.concat list, ', '}}"

int_lists = (lists, level) ->
  if #lists == 0
    '{}'
  elseif #lists == 1
    "{#{int_list lists[1]}}"
  else
    rows = [indent int_list(row), level + 1 for row in *lists]
    table.insert rows, 1, '{'
    table.insert rows, indent '}', level
    table.concat rows, '\n'

{
  module_imports: {'triplets_with_sum'},

  generate_test: (case, level) ->
    lines = {
      "result = triplets_with_sum #{case.input.n}",
      "expected = #{int_lists case.expected, level}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
