string_list = (list, level) ->
  lines = [indent quote(elem) .. ',', level + 1 for elem in *list]
  table.insert lines, 1, '{'
  table.insert lines, indent('}', level)
  table.concat lines, '\n'

{
  module_name: 'tournament',

  generate_test: (case, level) ->
    lines = {
      "write_file 'tournament.dsv', #{string_list case.input.rows, level}",
      "result = tournament.tally 'tournament.dsv'",
      "os.remove 'tournament.dsv'",
      "expected = #{string_list case.expected, level}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'

  test_helpers: [[

  
  write_file = (filename, lines) ->
    with io.open filename, 'w'
      \write table.concat lines, '\n'
      \close!
]]
}
