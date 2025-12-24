{
  module_name: 'recite',

  generate_test: (case, level) ->
    input = table.concat [quote word for word in *case.input.strings], ', '
    local expected
    if #case.expected == 0
      expected = "''"
    else
      expected = "[[\n#{table.concat case.expected, '\n'}\n]]"

    lines = {
      (indent "result = recite {#{input}}", level),
      (indent 'expected = ', level) .. expected,
      (indent 'assert.are.equal expected, result', level)
    }
    table.concat lines, '\n'
}
