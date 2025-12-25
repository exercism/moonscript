{
  module_name: 'Yacht',
  generate_test: (case, level) ->
    lines = {
      "result = Yacht.score #{quote case.input.category}, {#{table.concat case.input.dice, ', '}}",
      "assert.is.equal #{case.expected}, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
