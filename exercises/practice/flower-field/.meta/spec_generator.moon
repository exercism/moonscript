{
  module_name: 'FlowerField'

  generate_test: (case, level) ->
    lines = {}

    if #case.input.garden == 0
      table.insert lines, "garden = {}"
    else
      table.insert(lines, "gard en = {")
      for row in *case.input.garden
        table.insert(lines, "  #{quote row}")
      table.insert(lines, "}")

    if #case.expected == 0
      table.insert lines, "expected = {}"
    else
      table.insert(lines, "expected = {")
      for row in *case.expected
        table.insert(lines, "  #{quote row}")
      table.insert(lines, "}")

    table.insert(lines, "result = FlowerField.#{case.property} garden")
    table.insert(lines, "assert.are.same expected, result")

    table.concat [indent line, level for line in *lines], '\n'
}
