import table_tostring_ordered from require 'test_helpers'
keys = {'year', 'month', 'week', 'dayofweek'}

{
  module_imports: {'meetup'}

  generate_test: (case, level) ->
    lines = {
      "result = meetup #{table_tostring_ordered case.input, keys}"
      "expected = #{quote case.expected}"
      "assert.are.equal expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
