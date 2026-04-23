import word_list from require 'test_helpers'

{
  module_name: 'find_anagrams',
  generate_test: (case, level) ->
    lines = {
      "result = find_anagrams #{quote case.input.subject}, #{word_list case.input.candidates}",
      "expected = #{word_list case.expected}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
