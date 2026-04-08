{
  module_name: 'Gigasecond',

  generate_test: (case, level) ->
    lines = {
      "result = Gigasecond.#{case.property} #{quote case.input.moment}",
      "expected = #{quote case.expected}",
      "assert.are.equal expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'

  exclusions: {
    {key: 'scenarios', op: 'contains', value: 'immutable'}
  }
}
