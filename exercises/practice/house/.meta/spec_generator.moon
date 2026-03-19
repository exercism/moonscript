string_list = (list, level) ->
  if #list <= 2
    "{#{table.concat [quote elem for elem in *list], ', '}}"
  else
    instrs = [indent quote(elem) .. ',', level + 1 for elem in *list]
    table.insert instrs, 1, '{'
    table.insert instrs, indent('}', level)
    table.concat instrs, '\n'

{
  module_name: 'House',

  generate_test: (case, level) ->
    lines = {
      "result = House.#{case.property} #{case.input.startVerse}, #{case.input.endVerse}",
      "expected = #{string_list case.expected, level}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
