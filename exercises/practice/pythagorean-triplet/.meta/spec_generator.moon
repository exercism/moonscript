import int_lists from require 'test_helpers'

{
  module_imports: {'triplets_with_sum'},

  generate_test: (case, level) ->
    lines = {
      "result = triplets_with_sum #{case.input.n}",
      "expected = #{int_lists case.expected, level}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
