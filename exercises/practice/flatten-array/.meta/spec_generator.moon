json = (require 'dkjson').use_lpeg!

int_list = (list) -> "{#{table.concat list, ', '}}"

-- Lua can't store the literal `nil` in a table.  nil, being the
-- absence of a value, is used to delete a key in a table.  And
-- `ipairs` stops at the first index gap.  Seems to me, the
-- easiest way to render an arbitrary list of lists is to
-- stringify it back into JSON, and then munge the string.
-- Unfortunately, we seem to lose _trailing_ nulls this way.

nested_lists = (list, desc) ->
  a = json.encode list
  a = a\gsub '%[', '{'
  a = a\gsub '%]', '}'
  a = a\gsub ',', ', '
  a = a\gsub 'null', '"null"'
  
  if desc == "null values are omitted from the final result"
    a\gsub '}$', ', "null"}'
  else
    a

{
  module_imports: {'flatten'},

  generate_test: (case, level) ->
    lines = {
      "input = #{nested_lists case.input.array, case.description}",
      "expected = #{int_list case.expected}",
      "assert.are.same expected, flatten input"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
