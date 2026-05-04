import indent, json_string, kv_table from require 'spec_helpers'

{
  module_imports: {'count_words'},

  generate_test: (case, level) ->
    lines = {
      "result = count_words #{json_string case.input.sentence}",
      "expected = #{kv_table case.expected, level}",
      "assert.are.same result, expected"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
