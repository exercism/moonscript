import word_list from require 'test_helpers'

{
  module_name: 'recite',

  generate_test: (case, level) ->
    expected = if is_empty case.expected
      "''"
    else
      "[[\n#{table.concat case.expected, '\n'}\n]]"

    lines = {
      "result = recite #{word_list case.input.strings}"
      "expected = #{expected}"
      'assert.are.equal expected, result'
    }
    table.concat [indent line, level for line in *lines], '\n'
}
