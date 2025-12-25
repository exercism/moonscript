str_list = (list, level) ->
  if #list <= 1
    "{#{table.concat [quote elem for elem in *list], ', '}}"
  else
    item = [indent quote(elem) .. ',', level + 1 for elem in *list]
    table.insert item, 1, '{'
    table.insert item, indent('}', level)
    table.concat item, '\n'


{
  module_name: 'TwelveDays',

  generate_test: (case, level) ->
    lines = {
      "result = TwelveDays.#{case.property} #{case.input.startVerse}, #{case.input.endVerse}",
      "expected = #{str_list case.expected, level}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
