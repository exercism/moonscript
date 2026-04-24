{
  module_name: 'RailFenceCipher',

  generate_test: (case, level) ->
    lines = {
      "result = RailFenceCipher.#{case.property} #{case.input.rails}, #{quote case.input.msg}",
      "expected = #{quote case.expected}",
      "assert.are.equal expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
