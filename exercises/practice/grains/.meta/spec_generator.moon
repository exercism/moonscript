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
      -- apparently Lua can't represent this number exactly, so hardcode it.
      --   > string.format('%.0f', 18446744073709551615)
      --   18446744073709551616
      --   > 18446744073709551615 == 18446744073709551616
      --   true
      table.insert lines, "assert.are.equal 18446744073709551615, Grains.#{case.property}!"

    table.concat [indent line, level for line in *lines], '\n'
}
