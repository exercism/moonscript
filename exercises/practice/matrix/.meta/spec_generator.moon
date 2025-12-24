json = require 'dkjson'
json_string = (s) -> json.encode s

int_list = (list) -> "{#{table.concat list, ', '}}"


{
  module_name: 'Matrix',

  generate_test: (case, level) ->
    lines = {
      "result = Matrix.#{case.property} #{json_string case.input.string}, #{case.input.index}",
      "expected = #{int_list case.expected}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
