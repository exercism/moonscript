import string_list from require 'test_helpers'

{
  module_imports: {'gamestate'},

  generate_test: (case, level) ->
    lines = { "board = #{string_list case.input.board, level}" }
    if case.expected.error
      table.insert lines, "f = -> #{case.property} board"
      table.insert lines, "assert.has.error f, #{quote case.expected.error}"
    else
      table.insert lines, "assert.are.equal #{quote case.expected}, #{case.property} board"
    table.concat [indent line, level for line in *lines], '\n'
}
