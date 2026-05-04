import indent, quote from require 'spec_helpers'

{
  module_name: 'ResistorColorDuo',
  generate_test: (case, level) ->
    input = [quote color for color in *case.input.colors]
    lines = {
      "result = ResistorColorDuo.value #{table.concat input, ', '}",
      "assert.are.equal #{case.expected}, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
