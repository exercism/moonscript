import indent, string_list from require 'spec_helpers'

{
  module_imports: {'rectangles'},

  generate_test: (case, level) ->
    lines = {
      "input = #{string_list case.input.strings, level, {inline: 1}}",
      "assert.are.equal #{case.expected}, rectangles input"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
