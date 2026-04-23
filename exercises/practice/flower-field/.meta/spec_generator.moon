import string_list from require 'test_helpers'
{
  module_name: 'FlowerField'

  generate_test: (case, level) ->
    lines = {
      "garden = #{string_list case.input.garden, level}"
      "expected = #{string_list case.expected, level}"
      "result = FlowerField.#{case.property} garden"
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
