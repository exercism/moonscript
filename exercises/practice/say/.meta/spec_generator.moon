import indent, quote from require 'spec_helpers'

{
  module_name: 'Say',

  generate_test: (case, level) ->
    lines = if case.expected.error
      {
        "f = -> Say.in_english #{case.input.number}",
        "assert.has.error f,#{quote case.expected.error}"
      }
    else
      {
        "result = Say.in_english #{case.input.number}",
        "expected = #{quote case.expected}",
        "assert.are.equal expected, result"
      }
    table.concat [indent line, level for line in *lines], '\n'
}
