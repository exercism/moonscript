import int_lists, word_list from require 'test_helpers'

{
  module_name: 'GameOfLife',

  generate_test: (case, level) ->
    lines = {
      "matrix = #{int_lists case.input.matrix, level}"
      "result = GameOfLife.#{case.property} matrix"
      "expected = #{int_lists case.expected, level}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
