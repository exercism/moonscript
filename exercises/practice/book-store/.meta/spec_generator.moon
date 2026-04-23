import int_list from require 'test_helpers'

{
  module_name: 'BookStore',

  generate_test: (case, level) ->
    lines = {
      "result = BookStore.#{case.property} #{int_list case.input.basket}",
      "expected = #{case.expected}",
      "assert.are.equal expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
