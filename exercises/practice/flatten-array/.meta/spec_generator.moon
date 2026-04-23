-- A simple way to render an arbitrary list of lists is to stringify it
-- and then munge the string into a Lua table literal.
json = (require 'dkjson').use_lpeg!
nested_lists = (list) ->
  a = json.encode list
  a = a\gsub '%[', '{'
  a = a\gsub '%]', '}'
  a = a\gsub ',', ', '
  a = a\gsub 'null', '"null"'
  a

import int_list from require 'test_helpers'

{
  module_imports: {'flatten'},

  generate_test: (case, level) ->
    lines = {
      "input = #{nested_lists case.input.array}",
      "expected = #{int_list case.expected}",
      "assert.are.same expected, flatten input"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
