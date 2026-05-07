import indent, int_list, int_lists, table_tostring from require 'spec_helpers'

cage = (c) ->
  "sum: #{c.sum}, size: #{c.size}, exclude: #{int_list c.exclude}"

{
  module_imports: {'combinations'},

  generate_test: (case, level) ->
    lines = {
      "result = #{case.property} #{cage case.input.cage}",
      "expected = #{int_lists case.expected, level}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
