import int_list, string_list, table_contains from require 'test_helpers'

{
  module_name: 'Forth',

  generate_test: (case, level) ->
    local lines
    if case.scenarios and table_contains case.scenarios, 'local-scope'
      lines = {
        "interp1 = Forth!",
        "interp2 = Forth!",
        "interp1\\evaluate #{string_list case.input.instructionsFirst, level}",
        "interp2\\evaluate #{string_list case.input.instructionsSecond, level}",
        "assert.are.same #{int_list case.expected[1]}, interp1\\stack!",
        "assert.are.same #{int_list case.expected[2]}, interp2\\stack!",
      }

    else
      lines = {
        'interpreter = Forth!',
        "instructions = #{string_list case.input.instructions, level}",
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
