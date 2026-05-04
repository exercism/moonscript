import indent from require 'spec_helpers'

prism = (p) -> "{id: #{p.id}, x: #{p.x}, y: #{p.y}, angle: #{p.angle}}"
prism_list = (ps, level) ->
  lines = {"{"}
  table.insert lines, indent "#{prism p}", level + 1 for p in *ps
  table.insert lines, indent "}", level
  table.concat lines, "\n"

{
  module_name: 'Prism'

  generate_test: (case, level) ->
    lines = {
      "start = {x: #{case.input.start.x}, y: #{case.input.start.y}, angle: #{case.input.start.angle}}"
    }

    if #case.input.prisms == 0
      table.insert lines, "prisms = {}"
    else
      table.insert lines, "prisms = #{prism_list case.input.prisms, level}"

    table.insert lines, "expected = {#{table.concat(case.expected.sequence, ', ')}}"
    table.insert lines, "result = Prism.#{case.property} start, prisms"
    table.insert lines, "assert.are.same expected, result"

    table.concat [indent line, level for line in *lines], '\n'
}
