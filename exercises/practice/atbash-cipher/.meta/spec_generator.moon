{
  module_name: 'AtbashCipher',

  generate_test: (case, level) ->
    lines = {
      "result = AtbashCipher.#{case.property} #{quote case.input.phrase}"
      "expected = #{quote case.expected}"
      "assert.are.equal expected, result"
    }

    table.concat [indent line, level for line in *lines], '\n'
}
