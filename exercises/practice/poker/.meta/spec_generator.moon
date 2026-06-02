import indent, string_list from require 'spec_helpers'
assertions = require 'spec_helpers/assertions'

{
  module_name: 'Poker',

  test_helpers: assertions.same_elements

  generate_test: (case, level) ->
    lines = {
      "hands = #{string_list case.input.hands, level, inline: 1}",
      "expected = #{string_list case.expected, level, inline: 1}",
    }
    assertion = if #case.expected == 1 then 'assert.are.same' else 'assert.has.same_elements'
    table.insert lines, "#{assertion} expected, Poker.#{case.property} hands"
    table.concat [indent line, level for line in *lines], '\n'
}
