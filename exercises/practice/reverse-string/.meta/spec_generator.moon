{
  module_name: 'reverse',
  generate_test: (case, level) ->
    lines = {
      "result = reverse #{quote case.input.value}",
      "assert.are.equal #{quote case.expected}, result",
    }
    table.concat [indent line, level for line in *lines], "\n"
}
