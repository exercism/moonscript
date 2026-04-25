{
  module_name: 'Wordy',

  generate_test: (case, level) ->
    lines = if type(case.expected) == 'table'
      {
        "fn = -> Wordy.#{case.property} #{quote case.input.question}",
        "assert.has.error fn, #{quote case.expected.error}"
      }
    else
      {
        "result = Wordy.#{case.property} #{quote case.input.question}",
        "assert.are.equal #{case.expected}, result"
      }
    table.concat [indent line, level for line in *lines], '\n'
}
