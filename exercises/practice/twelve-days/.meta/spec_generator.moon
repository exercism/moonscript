import string_list from require 'test_helpers'

{
  module_name: 'TwelveDays',

  generate_test: (case, level) ->
    lines = {
      "result = TwelveDays.#{case.property} #{case.input.startVerse}, #{case.input.endVerse}",
      "expected = #{string_list case.expected, level}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
