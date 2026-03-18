format_predicate = (pred) ->
  switch pred
    when "fn(x) -> true"
      "(_) -> true"
    when "fn(x) -> false"
      "(_) -> false"
    when "fn(x) -> x % 2 == 1"
      "(num) -> num % 2 == 1"
    when "fn(x) -> x % 2 == 0"
      "(num) -> num % 2 == 0"
    when "fn(x) -> contains(x, 5)"
      "(list) -> contains list, 5"
    when "fn(x) -> starts_with(x, 'z')"
      "(str) -> starts_with str, 'z'"
    else
      pred

format_list = (list) ->
  if #list == 0
    "{}"
  elseif type(list[1]) == 'string'
    "{" .. table.concat([quote(elem) for elem in *list], ', ') .. "}"
  else
    "{" .. table.concat(list, ', ') .. "}"

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
