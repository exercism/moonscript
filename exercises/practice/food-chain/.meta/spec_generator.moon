import string_list from require 'test_helpers'

{
  module_name: 'FoodChain',

  generate_test: (case, level) ->
    lines = {
      "result = FoodChain.#{case.property} #{case.input.startVerse}, #{case.input.endVerse}",
      "expected = #{string_list case.expected, level}",
      "assert.are.equal table.concat(expected, \"\\n\"), result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
