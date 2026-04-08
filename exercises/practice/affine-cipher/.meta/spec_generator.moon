{
  module_imports: {'encode', 'decode'},

  generate_test: (case, level) ->
    local lines
    if type(case.expected) == 'string'
      lines = {
        "result = #{case.property} #{quote case.input.phrase}, {a: #{case.input.key.a}, b: #{case.input.key.b}}",
        "expected = #{quote case.expected}",
        "assert.are.equal expected, result"
      }
    else
      lines = {
        "f = -> #{case.property} #{quote case.input.phrase}, {a: #{case.input.key.a}, b: #{case.input.key.b}}",
        "assert.has.error f, #{quote case.expected.error}"
      }
    table.concat [indent line, level for line in *lines], '\n'
}
