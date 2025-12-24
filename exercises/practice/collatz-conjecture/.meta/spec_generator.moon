{
  module_name: 'CollatzConjecture',
  generate_test: (case, level) ->
    local lines
    if type(case.expected) == 'number'
      lines = {
        "result = CollatzConjecture.steps #{case.input.number}",
        "assert.are.equal #{case.expected}, result"
      }
    else
      lines = {
        "f = -> CollatzConjecture.steps #{case.input.number}",
        "assert.has.errors f, '#{case.expected.error}'"
      }

    table.concat [indent line, level for line in *lines], '\n'
}
