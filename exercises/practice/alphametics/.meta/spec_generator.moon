import kv_table from require 'test_helpers'

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
        "expected = #{kv_table case.expected, level}",
        "assert.is.same_kv result, expected"
      }
    table.concat [indent line, level for line in *lines], '\n'

  test_helpers: [[
  -- ----------------------------------------------------------
  same_kv = (state, arguments) ->
    actual = arguments[1]
    return false if type(actual) != 'table'
    expected = arguments[2]
    size = (t) -> #[k for k, _ in pairs t]
    return false if size(expected) != size(actual)
    for k, v in pairs expected
      return false if actual[k] != v
    true

  say = require 'say'
  say\set 'assertion.same_kv.positive', 'Actual result\n%s\ndoes not have the same keys and values as expected\n%s'
  say\set 'assertion.same_kv.negative', 'Actual result\n%s\nwas not supposed to be the same as expected\n%s'
  assert\register 'assertion', 'same_kv', same_kv, 'assertion.same_kv.positive', 'assertion.same_kv.negative'
  -- ----------------------------------------------------------
]]
}
