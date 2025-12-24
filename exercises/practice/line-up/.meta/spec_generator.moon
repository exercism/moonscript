{
  module_name: 'LineUp',

  generate_test: (case, level) ->
    lines = {
      "result = LineUp.#{case.property} #{quote case.input.name}, #{case.input.number}",
      "expected = #{quote case.expected}",
      "assert.are.equal expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
