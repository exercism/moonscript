{
  module_name: 'nucleotide_count',

  generate_test: (case, level) ->
    local lines
    if case.expected.error
      lines = {
        "f = -> nucleotide_count '#{case.input.strand}'",
        "assert.has.errors f, '#{case.expected.error}'"
      }
    else
      -- use "same", not "equal", to compare tables
      lines = {
        "expected = A: #{case.expected.A}, C: #{case.expected.C}, G: #{case.expected.G}, T: #{case.expected.T}"
        "result = nucleotide_count '#{case.input.strand}'",
        "assert.are.same expected, result"
      }

    table.concat [indent line, level for line in *lines], '\n'
}
