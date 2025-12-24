{
  module_name: 'is_pangram',
  generate_test: (case, level) ->
    lines = {
      "result = is_pangram '#{case.input.sentence}'",
      "assert.is_#{case.expected} result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
