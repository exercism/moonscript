table_contains = (list, target) ->
  for elem in *list
    return true if elem == target
  false

int_list = (list) -> "{#{table.concat list, ', '}}"

instruction_list = (list, level) ->
  if #list <= 2
    "{#{table.concat [quote elem for elem in *list], ', '}}"
  else
    instrs = [indent quote(elem) .. ',', level + 1 for elem in *list]
    table.insert instrs, 1, '{'
    table.insert instrs, indent('}', level)
    table.concat instrs, '\n'


{
  module_name: 'Forth',

  generate_test: (case, level) ->
    local lines
    if case.scenarios and table_contains case.scenarios, 'local-scope'
      lines = {
        "interp1 = Forth!",
        "interp2 = Forth!",
        "interp1\\evaluate #{instruction_list case.input.instructionsFirst, level}",
        "interp2\\evaluate #{instruction_list case.input.instructionsSecond, level}",
        "assert.are.same #{int_list case.expected[1]}, interp1\\stack!",
        "assert.are.same #{int_list case.expected[2]}, interp2\\stack!",
      }

    else
      lines = {
        'interpreter = Forth!',
        "instructions = #{instruction_list case.input.instructions, level}",
      }

      if case.expected.error
        table.insert lines, line for line in *{
          'f = -> interpreter\\evaluate instructions',
          "assert.has.errors f, #{quote case.expected.error}"
        }

      else
        table.insert lines, line for line in *{
          'interpreter\\evaluate instructions',
          "expected = #{int_list case.expected}",
          'assert.is.same expected, interpreter\\stack!'
        }

    table.concat [indent line, level for line in *lines], '\n'
}
