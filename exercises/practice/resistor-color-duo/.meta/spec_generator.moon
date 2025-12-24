{
  module_name: 'ResistorColorDuo',
  generate_test: (case, level) ->
    input = ["'#{color}'" for color in *case.input.colors]
    lines = {
      "result = ResistorColorDuo.value #{table.concat input, ', '}",
      "assert.are.same #{case.expected}, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
