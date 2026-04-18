string_list = (list, level) ->
  if #list <= 2
    "{#{table.concat [quote elem for elem in *list], ', '}}"
  else
    lines = [indent quote(elem) .. ',', level + 1 for elem in *list]
    table.insert lines, 1, '{'
    table.insert lines, indent('}', level)
    table.concat lines, '\n'

{
  module_name: 'FoodChain',

  generate_test: (case, level) ->
    lines = {
      "result = FoodChain.#{case.property} #{case.input.startVerse}, #{case.input.endVerse}",
      "expected = #{string_list case.expected, level}",
      "assert.are.equal table.concat(expected, \"\\n\"), result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
