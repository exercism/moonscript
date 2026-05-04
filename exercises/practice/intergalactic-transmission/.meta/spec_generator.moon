import indent, quote, string_list from require 'spec_helpers'

{
  module_imports: {'transmitSequence', 'decodeMessage'},

  test_helpers: [[
  -- Inputs and expected data are given in hexadecimal.
]]

  generate_test: (case, level) ->
    lines = if case.expected.error
      {
        "f = -> #{case.property} #{string_list case.input.message, level, inline: 7}",
        "assert.has.error f, #{quote case.expected.error}"
      }
    else
      {
        "result = #{case.property} #{string_list case.input.message, level, inline: 7}",
        "expected = #{string_list case.expected, level, inline: 7}",
        "assert.are.same expected, result"
      }

    table.concat [indent line, level for line in *lines], '\n'
}
