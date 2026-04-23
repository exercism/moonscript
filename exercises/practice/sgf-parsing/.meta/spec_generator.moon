import json_string, table_dump from require 'test_helpers'

{
  module_name: 'SGFParser',

  test_helpers: [[
  assert\set_parameter "TableFormatLevel", 5
]],

  generate_test: (case, level) ->
    lines = if case.expected.error
      {
        "f = -> SGFParser.parse #{json_string case.input.encoded}"
        "assert.has_error f, #{quote case.expected.error}"
      }
    else
      {
        "result = SGFParser.#{case.property} #{json_string case.input.encoded}",
        "expected = #{table_dump case.expected, level}",
        "assert.are.same expected, result"
      }
    table.concat [indent line, level for line in *lines], '\n'
}
