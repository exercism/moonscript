list_of_digits = (digits) -> "{#{table.concat digits, ', '}}"

{
  module_imports: {'rebase'},

  generate_test: (case, level) ->
    local lines
    if not case.expected.error
      lines = {
        "result = rebase in_base: #{case.input.inputBase}, out_base: #{case.input.outputBase}, digits: #{list_of_digits case.input.digits}",
        "expected = #{list_of_digits case.expected}",
        "assert.are.same expected, result"
      }
    else
      lines = {
        "f = -> rebase in_base: #{case.input.inputBase}, out_base: #{case.input.outputBase}, digits: #{list_of_digits case.input.digits}",
        "assert.has.errors f, #{quote case.expected.error}"
      }

    table.concat [indent line, level for line in *lines], '\n'
}
