{
  module_imports: {'factors'},
  generate_test: (case, level) ->
    lines = {
      "expected = {#{table.concat case.expected, ', '}}",
      "result = factors #{case.input.value}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
