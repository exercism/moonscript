json = require 'dkjson'
json_string = (s) -> json.encode s

{
  module_name: 'Markdown',

  generate_test: (case, level) ->
    lines = {
      "result = Markdown.#{case.property} #{json_string case.input.markdown}",
      "expected = #{quote case.expected}",
      "assert.are.equal expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
