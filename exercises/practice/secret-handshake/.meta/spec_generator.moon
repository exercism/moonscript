import word_list from require 'test_helpers'

{
  module_name: 'SecretHandshake',

  generate_test: (case, level) ->
    local lines
    -- you may want to "switch case.property" here
    lines = {
      "result = SecretHandshake.#{case.property} #{case.input.number}",
      "expected = #{word_list case.expected}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
