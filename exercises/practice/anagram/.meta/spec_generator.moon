list_of_words = (list) ->
  "{#{table.concat [quote word for word in *list], ', '}}"

{
  module_name: 'find_anagrams',
  generate_test: (case, level) ->
    lines = {
      "result = find_anagrams #{quote case.input.subject}, #{list_of_words case.input.candidates}",
      "expected = #{list_of_words case.expected}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
