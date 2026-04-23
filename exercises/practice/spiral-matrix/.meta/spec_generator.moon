import int_lists from require 'test_helpers'

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
