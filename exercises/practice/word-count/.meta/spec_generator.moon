json = require 'dkjson'

kv_table = (tbl, level) ->
  lines = {'{'}
  for k, v in pairs tbl
    key = if k\match('^%a%w*$') then k else "#{quote k}"
    table.insert lines, indent "#{key}: #{v},", level + 1
  table.insert lines, indent '}', level
  table.concat lines, '\n'


{
  module_imports: {'count_words'},

  test_helpers: [[
  -- ----------------------------------------------------------
  same_kv = (state, arguments) ->
    expected = arguments[1]
    actual = arguments[2]
    return false if #expected != #actual
    for k, v in pairs expected
      return false if actual[k] != v
    true

  say = require 'say'
  say\set 'assertion.same_kv.positive', 'Expected\n%s\nto have the same keys and values as\n%s'
  say\set 'assertion.same_kv.negative', 'Expected\n%s\nto not have the same keys and values as\n%s'
  assert\register 'assertion', 'same_kv', same_kv, 'assertion.same_kv.positive', 'assertion.same_kv.negative'
  -- ----------------------------------------------------------
]]

  generate_test: (case, level) ->
    lines = {
      "result = count_words #{json.encode case.input.sentence}",
      "expected = #{kv_table case.expected, level}",
      "assert.has.same_kv expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
