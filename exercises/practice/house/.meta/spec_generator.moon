import string_list from require 'test_helpers'

{
  module_name: 'House',

  generate_test: (case, level) ->
    lines = {
      "result = House.#{case.property} #{case.input.startVerse}, #{case.input.endVerse}",
      "expected = #{string_list case.expected, level}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
