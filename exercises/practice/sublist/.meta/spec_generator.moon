import indent, quote, int_list from require 'spec_helpers'

{
  module_imports: {'sublist'},

  generate_test: (case, level) ->
    lines = {
      "listOne = #{int_list case.input.listOne}"
      "listTwo = #{int_list case.input.listTwo}"
      "assert.are.equal #{quote case.expected}, sublist listOne, listTwo"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
