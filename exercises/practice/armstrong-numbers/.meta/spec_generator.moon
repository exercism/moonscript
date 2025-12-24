{
  module_name: 'ArmstrongNumbers',
  generate_test: (case, level) ->
    lines = {
      "result = ArmstrongNumbers.is_armstrong #{case.input.number}",
      "assert.is_#{case.expected} result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
