string_list = (list, level) ->
  if #list <= 2
    "{#{table.concat [quote elem for elem in *list], ', '}}"
  else
    instrs = [indent quote(elem) .. ',', level + 1 for elem in *list]
    table.insert instrs, 1, '{'
    table.insert instrs, indent('}', level)
    table.concat instrs, '\n'

{
  module_imports: {'transpose'},

  generate_test: (case, level) ->
    lines = {
      "input = #{string_list case.input.lines, level}",
      "expected = #{string_list case.expected, level}",
      "assert.are.same expected, transpose input"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
