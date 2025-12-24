{
  module_name: 'ResistorColor',

  generate_test: (case, level) ->
    local lines
    if case.property == "colorCode"
      lines = {
        "result = ResistorColor.color_code '#{case.input.color}'",
        "assert.are.equal #{case.expected}, result"
      }
    else
      lines = {
        "expected = {'black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white'}"
        "result = ResistorColor.colors!",
        "assert.are.same expected, result"
      }

    table.concat [indent(line, level) for line in *lines], '\n'
}


