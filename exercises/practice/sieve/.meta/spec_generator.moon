import int_list_wrapped from require 'test_helpers'

{
  module_name: 'Sieve',

  generate_test: (case, level) ->
    lines = {
      "result = Sieve.#{case.property} #{case.input.limit}",
      "expected = #{int_list_wrapped case.expected, level}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
