{
  module_name: "hamming",
  generate_test: (case, level) ->
    local lines
    if type(case.expected) == "number"
      lines = {
        "result = hamming.distance '#{case.input.strand1}', '#{case.input.strand2}'",
        "assert.are.equal #{case.expected}, result"
      }
    else
      lines = {
        "f = -> hamming.distance '#{case.input.strand1}', '#{case.input.strand2}'",
        "assert.has.error f, '#{case.expected.error}'"
      }

    table.concat [indent line, level for line in *lines], '\n'
}
