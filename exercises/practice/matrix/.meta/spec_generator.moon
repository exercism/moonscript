import json_string, int_list from require 'test_helpers'

{
  module_name: 'Matrix',

  generate_test: (case, level) ->
    lines = {
      "result = Matrix.#{case.property} #{json_string case.input.string}, #{case.input.index}",
      "expected = #{int_list case.expected}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
