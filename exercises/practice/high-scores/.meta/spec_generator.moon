import int_list from require 'test_helpers'

{
  module_name: 'HighScores',

  generate_test: (case, level) ->
    lines = {
      "scores = HighScores #{int_list case.input.scores}"
    }

    switch case.property
      when 'latestAfterTopThree'
        table.insert lines, "_ = scores\\personalTopThree!"
        table.insert lines, "result = scores\\latest!"
      when 'scoresAfterTopThree'
        table.insert lines, "_ = scores\\personalTopThree!"
        table.insert lines, "result = scores\\scores!"
      when 'latestAfterBest'
        table.insert lines, "_ = scores\\personalBest!"
        table.insert lines, "result = scores\\latest!"
      when 'scoresAfterBest'
        table.insert lines, "_ = scores\\personalBest!"
        table.insert lines, "result = scores\\scores!"
      else
        table.insert lines, "result = scores\\#{case.property}!"

    if type(case.expected) == 'table'
      table.insert lines, "expected = #{int_list case.expected}"
    else
      table.insert lines, "expected = #{case.expected}"

    table.insert lines, "assert.are.same expected, result"
    table.concat [indent line, level for line in *lines], '\n'
}
