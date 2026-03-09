format = (number) ->
  string.format '%.0f', number

{
  module_name: 'Grains'

  generate_test: (case, level) ->
    lines = {}
    if type(case.expected) == 'table' and case.expected.error
      table.insert lines, "assert.has.errors -> Grains.#{case.property} #{case.input.square}, #{quote case.expected.error}"
    else if case.property == 'square'
      table.insert lines, "assert.are.equal #{format case.expected}, Grains.#{case.property} #{case.input.square}"
    else
      table.insert lines, "assert.are.equal #{format case.expected}, Grains.#{case.property}!"

    table.concat [indent line, level for line in *lines], '\n'
}
