{
  module_name: 'RotationalCipher',

  generate_test: (case, level) ->
    lines = {
      "result = RotationalCipher.rotate #{quote case.input.text}, #{case.input.shiftKey}",
      "expected = #{quote case.expected}",
      "assert.are.equal expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
