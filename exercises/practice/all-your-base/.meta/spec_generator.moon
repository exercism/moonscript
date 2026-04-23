import int_list from require 'test_helpers'

{
  module_imports: {'rebase'},

  generate_test: (case, level) ->
    local lines
    if not case.expected.error
      lines = {
        "result = rebase in_base: #{case.input.inputBase}, out_base: #{case.input.outputBase}, digits: #{int_list case.input.digits}",
        "expected = #{int_list case.expected}",
        "assert.are.same expected, result"
      }
    else
      lines = {
        "f = -> rebase in_base: #{case.input.inputBase}, out_base: #{case.input.outputBase}, digits: #{int_list case.input.digits}",
        "assert.has.errors f, #{quote case.expected.error}"
      }

    table.concat [indent line, level for line in *lines], '\n'
}
