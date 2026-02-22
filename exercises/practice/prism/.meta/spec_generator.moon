{
  module_name: 'Prism'

  generate_test: (case, level) ->
    lines = {
      "start = {x: #{case.input.start.x}, y: #{case.input.start.y}, angle: #{case.input.start.angle}}"
    }

    if #case.input.prisms == 0
      table.insert lines, "prisms = {}"
    else
      table.insert(lines, "prisms = {")
      for p in *case.input.prisms
        table.insert(lines, "  {id: #{p.id}, x: #{p.x}, y: #{p.y}, angle: #{p.angle}}")
      table.insert(lines, "}")

    table.insert(lines, "expected = {#{table.concat(case.expected.sequence, ', ')}}")
    table.insert(lines, "result = Prism.#{case.property} start, prisms")
    table.insert(lines, "assert.are.same expected, result")

    table.concat [indent line, level for line in *lines], '\n'
}
