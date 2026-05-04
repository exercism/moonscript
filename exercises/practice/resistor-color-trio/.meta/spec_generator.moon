import indent, quote from require 'spec_helpers'

{
  module_name: 'ResistorColorTrio',

  generate_test: (case, level) ->
    colors = table.concat [quote color for color in *case.input.colors], ', '
    expected = quote "#{case.expected.value} #{case.expected.unit}"
    lines = {
      "result = ResistorColorTrio.#{case.property} #{colors}",
      "assert.are.equal #{expected}, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
