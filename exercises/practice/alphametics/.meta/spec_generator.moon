import indent, quote, is_json_null, table_tostring_sortby_keys from require 'spec_helpers'

{
  module_imports: {'solve'},

  generate_test: (case, level) ->
    lines = if is_json_null case.expected
      {
        "puzzle = #{quote case.input.puzzle}",
        "assert.is.falsy solve puzzle"
      }
    else
      {
        "puzzle = #{quote case.input.puzzle}",
        "result = solve puzzle",
        "expected = #{table_tostring_sortby_keys case.expected, level}",
        "assert.are.same result, expected"
      }
    table.concat [indent line, level for line in *lines], '\n'
}
