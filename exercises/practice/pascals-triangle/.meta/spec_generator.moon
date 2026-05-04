import indent, int_lists from require 'spec_helpers'

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
