import string_list from require 'test_helpers'

{
  module_name: 'Diamond'

  generate_test: (case, level) ->
    lines = {
      "result = Diamond.#{case.property} #{quote case.input.letter}"
      "expected = #{string_list case.expected, level}"
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
