int_list = (list) -> "{#{table.concat list, ', '}}"

{
  module_name: 'VariableLengthQuantity',

  generate_test: (case, level) ->
    local lines
    if case.expected.error
      lines = {
        "f = -> VariableLengthQuantity.#{case.property} #{int_list case.input.integers}"
        "assert.has.errors f, #{quote case.expected.error}"
      }
    else
      lines = {
        "result = VariableLengthQuantity.#{case.property} #{int_list case.input.integers}",
        "expected = #{int_list case.expected}"
        "assert.are.same expected, result"
      }
    table.concat [indent line, level for line in *lines], '\n'
}
