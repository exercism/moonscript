format_predicate = (pred) ->
  p = pred\gsub "fn%(x%) %-> ", "(x) -> "
  p = p\gsub "contains%(x, 5%)", "contains x, 5"
  p = p\gsub "starts_with%(x, 'z'%)", "starts_with x, 'z'"
  p

format_list = (list) ->
  if #list == 0
    return "{}"
  elseif type(list[1]) == 'string'
    return "{" .. table.concat([quote(elem) for elem in *list], ', ') .. "}"
  else
    return "{" .. table.concat(list, ', ') .. "}"

format_value = (val, level) ->
  if #val == 0
    '{}'
  elseif type(val[1]) == 'table'
    rows = [indent format_list(row), level + 1 for row in *val]
    table.insert rows, 1, '{'
    table.insert rows, indent('}', level)
    table.concat rows, '\n'
  else
    format_list(val)

{
  module_name: 'Strain'

  test_helpers: [[
  local starts_with, contains

  starts_with = (str, prefix) ->
    str\sub(1, #prefix) == prefix

  contains = (list, element) ->
    for item in *list
      if item == element
        return true
    false
]]

  generate_test: (case, level) ->


    lines = {
      "result = Strain.#{case.property} #{format_value(case.input.list, level)}, #{format_predicate case.input.predicate}"
      "expected = #{format_value(case.expected, level)}"
      "assert.are.same expected, result"
    }

    table.concat [indent line, level for line in *lines], '\n'
}
