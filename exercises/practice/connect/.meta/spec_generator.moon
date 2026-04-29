import string_list from require 'test_helpers'

{
  -- one of:
  module_name: 'Connect',

  generate_test: (case, level) ->
    lines = {
      "board = #{string_list case.input.board, level}",
      "assert.are.equal #{quote case.expected}, Connect.#{case.property} board"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
