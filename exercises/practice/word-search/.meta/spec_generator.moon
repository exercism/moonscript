import indent, string_list, table_dump, is_json_null from require 'spec_helpers'

{
  module_name: 'WordSearch',

  generate_test: (case, level) ->
    expected = case.expected
    for word, position in pairs expected
      if is_json_null position
        expected[word] = nil

    lines = {
      "grid = #{string_list case.input.grid, level, inline: 1}",
      "words = #{string_list case.input.wordsToSearchFor, level, inline: 1}"
      "expected = #{table_dump expected, level}",
      "assert.are.same expected, WordSearch(grid)\\find(words)"
    }
    table.concat [indent line, level for line in *lines], '\n'

  test_helpers: [[
  assert\set_parameter "TableFormatLevel", 3
]]

}
