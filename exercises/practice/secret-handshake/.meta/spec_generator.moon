list_of_strings = (list) ->
  "{#{table.concat [quote word for word in *list], ', '}}"

{
  module_name: 'SecretHandshake',

  generate_test: (case, level) ->
    local lines
    -- you may want to "switch case.property" here
    lines = {
      "result = SecretHandshake.#{case.property} #{case.input.number}",
      "expected = #{list_of_strings case.expected}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
