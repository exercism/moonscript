import string_list from require 'test_helpers'

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
