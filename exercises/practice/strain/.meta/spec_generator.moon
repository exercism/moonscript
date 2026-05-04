import indent, is_empty, int_list, word_list from require 'spec_helpers'

format_predicate = (pred) ->
  switch pred
    when "fn(x) -> true"                then "(_) -> true"
    when "fn(x) -> false"               then "(_) -> false"
    when "fn(x) -> x % 2 == 1"          then "(num) -> num % 2 == 1"
    when "fn(x) -> x % 2 == 0"          then "(num) -> num % 2 == 0"
    when "fn(x) -> contains(x, 5)"      then "(list) -> contains list, 5"
    when "fn(x) -> starts_with(x, 'z')" then "(str) -> starts_with str, 'z'"
    else
      pred

format_list = (list) ->
  if is_empty list
    '{}'
  elseif type(list[1]) == 'string'
    word_list list
  else
    int_list list

format_value = (val, level) ->
  if is_empty val
    '{}'
  elseif type(val[1]) == 'table' -- list of lists
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
      "result = Strain.#{case.property} #{format_value case.input.list, level }, #{format_predicate case.input.predicate}"
      "expected = #{format_value case.expected, level }"
      "assert.are.same expected, result"
    }

    table.concat [indent line, level for line in *lines], '\n'
}
