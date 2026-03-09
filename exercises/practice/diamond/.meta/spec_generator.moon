{
  module_name: 'Diamond'

  generate_test: (case, level) ->
    lines = {}
    table.insert lines, "result = Diamond.#{case.property} #{quote case.input.letter}"
    
    rows = [indent quote(row), level + 1 for row in *case.expected]
    table.insert rows, 1, '{'
    table.insert rows, indent('}', level)

    table.insert lines, "expected = #{table.concat rows, '\n'}"
    table.insert lines, "assert.are.same expected, result"

    table.concat [indent line, level for line in *lines], '\n'
}
