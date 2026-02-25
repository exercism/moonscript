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
    actual = arguments[1]
    expected = arguments[2]
    return false if #expected != #actual
    for k, v in pairs expected
      return false if actual[k] != v
    true

  say = require 'say'
  say\set 'assertion.same_kv.positive', 'Actual result\n%s\ndoes not have the same keys and values as expected\n%s'
  say\set 'assertion.same_kv.negative', 'Actual result\n%s\nwas not supposed to be the same as expected\n%s'
  assert\register 'assertion', 'same_kv', same_kv, 'assertion.same_kv.positive', 'assertion.same_kv.negative'
  -- ----------------------------------------------------------
]]

  generate_test: (case, level) ->
    lines = {
      "result = count_words #{json.encode case.input.sentence}",
      "expected = #{kv_table case.expected, level}",
      "assert.has.same_kv result, expected"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
