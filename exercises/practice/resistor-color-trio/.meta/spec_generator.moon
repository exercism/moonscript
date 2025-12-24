{
  module_name: 'ResistorColorTrio',

  generate_test: (case, level) ->
    lines = {
      "result = ResistorColorTrio.#{case.property} #{table.concat [quote color for color in *case.input.colors], ', '}",
      "assert.are.equal '#{case.expected.value} #{case.expected.unit}', result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
