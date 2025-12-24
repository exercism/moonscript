{
  module_name: 'count_eggs',
  generate_test: (case, level) ->
    lines = {
      "result = count_eggs #{case.input.number}",
      "assert.are.equal #{case.expected}, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
