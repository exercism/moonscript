{
  module_name: 'Scrabble',
  generate_test: (case, level) ->
    lines = {
      "result = Scrabble.score #{quote case.input.word}",
      "assert.are.equal #{case.expected}, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
