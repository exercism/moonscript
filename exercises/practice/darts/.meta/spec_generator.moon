{
  module_name: 'darts',
  generate_test: (case, level) ->
    lines = {
      "result = darts.score #{case.input.x}, #{case.input.y}",
      "assert.are.equal #{case.expected}, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
