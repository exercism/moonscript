{
  module_imports: {'abbreviate'},
  generate_test: (case, level) ->
    lines = {
      "result = abbreviate #{quote case.input.phrase}",
      "assert.are.equal #{quote case.expected}, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
