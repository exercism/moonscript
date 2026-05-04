import indent, int_list from require 'spec_helpers'

{
  module_imports: {'factors'},
  generate_test: (case, level) ->
    lines = {
      "result = factors #{case.input.value}",
      "expected = #{int_list case.expected}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
