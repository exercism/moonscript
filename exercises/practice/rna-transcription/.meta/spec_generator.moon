{
  module_name: 'to_rna',
  generate_test: (case, level) ->
    lines = {
      "result = to_rna #{quote case.input.dna}",
      "assert.are.equal #{quote case.expected}, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
