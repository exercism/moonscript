{
  module_imports: {'delivery_date'},

  generate_test: (case, level) ->
    lines = {
      "result = delivery_date #{quote case.input.description}, #{quote case.input.meetingStart}"
      "expected = #{quote case.expected}"
      "assert.are.equal expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
