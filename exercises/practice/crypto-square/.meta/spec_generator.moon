{
  module_imports: {'encode'},

  generate_test: (case, level) ->
    lines = {
      "result = encode #{quote case.input.plaintext}",
      "expected = #{quote case.expected}",
      "assert.are.equal expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
