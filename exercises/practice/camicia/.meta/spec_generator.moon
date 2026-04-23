import word_list from require 'test_helpers'

{
  module_name: 'Camicia'

  generate_test: (case, level) ->
    lines = {
      "playerA = #{word_list case.input.playerA}"
      "playerB = #{word_list case.input.playerB}"
      "expected = {"
      "  status: #{quote case.expected.status}"
      "  cards: #{case.expected.cards}"
      "  tricks: #{case.expected.tricks}"
      "}"
      "result = Camicia.#{case.property} playerA, playerB"
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
