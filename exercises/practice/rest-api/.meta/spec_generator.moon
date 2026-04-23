test_helpers = require 'test_helpers'
import table_dump from test_helpers

{
  module_name: 'RestApi',

  generate_test: (case, level) ->
    lines = {
      "database = #{table_dump case.input.database, level}",
      "api = RestApi database"
    }
    call = "result = api\\#{case.property\upper!} #{quote case.input.url}"
    if case.input.payload
      table.insert lines, "payload = #{table_dump case.input.payload, level}"
      call ..= ", payload"
    table.insert lines, call
    table.insert lines, "expected = #{table_dump case.expected, level}"
    table.insert lines, "assert.are.same expected, result"
    table.concat [indent line, level for line in *lines], '\n'

  -- we have deep tables to compare, display it all when not the same
  test_helpers: [[
  assert\set_parameter "TableFormatLevel", 4
]]
}
