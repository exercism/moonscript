{
  module_name: 'reverse',
  generate_test: (case, level) ->
    lines = {
      "result = reverse \"#{case.input.value}\"",
      "assert.are.same \"#{case.expected}\", result",
    }
    table.concat [indent line, level for line in *lines], "\n"
}
