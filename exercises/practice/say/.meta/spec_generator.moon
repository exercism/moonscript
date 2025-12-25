{
  module_name: 'Say',

  generate_test: (case, level) ->
    local lines
    switch type(case.expected)
      when 'table'
        lines = {
          "f = -> Say.in_english #{case.input.number}",
          "assert.has.error f,#{quote case.expected.error}"
        }
      else
        lines = {
          "result = Say.in_english #{case.input.number}",
          "expected = #{quote case.expected}",
          "assert.are.equal expected, result"
        }
    table.concat [indent line, level for line in *lines], '\n'
}
