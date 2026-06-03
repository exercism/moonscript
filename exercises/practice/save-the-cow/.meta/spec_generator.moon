import indent, quote, table_dump, word_list from require 'spec_helpers'

{
  module_name: 'SaveTheCow',

  generate_test: (case, level) ->
    lines = if case.expected.error
      {
        "game = SaveTheCow #{quote case.input.word}",
        "f = -> game\\guess #{word_list case.input.guesses}",
        "assert.has.error f, #{quote case.expected.error}"
      }
    else
      {
        "game = SaveTheCow #{quote case.input.word}",
        "result = game\\guess #{word_list case.input.guesses}",
        "expected = #{table_dump case.expected, level}",
        "assert.are.same expected, result"
      }
    table.concat [indent line, level for line in *lines], '\n'
}
