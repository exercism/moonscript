{
  module_name: 'SquareRoot',
  generate_test: (case, level) ->
    lines = {
      "result = SquareRoot.sqrt #{case.input.radicand}",
      "assert.are.equal #{case.expected}, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
