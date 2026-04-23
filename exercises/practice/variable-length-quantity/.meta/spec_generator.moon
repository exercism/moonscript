import int_list from require 'test_helpers'

{
  module_name: 'VariableLengthQuantity',

  generate_test: (case, level) ->
    lines = if case.expected.error
      {
        "f = -> VariableLengthQuantity.#{case.property} #{int_list case.input.integers}"
        "assert.has.errors f, #{quote case.expected.error}"
      }
    else
      {
        "result = VariableLengthQuantity.#{case.property} #{int_list case.input.integers}",
        "expected = #{int_list case.expected}"
        "assert.are.same expected, result"
      }
    table.concat [indent line, level for line in *lines], '\n'
}
