{
  module_name: 'DifferenceOfSquares',
  generate_test: (case, level=2) ->
    snakify = (s) -> s\gsub("%f[A-Z].", (upper) -> "_#{upper\lower!}")
    lines = {
      "result = DifferenceOfSquares.#{snakify case.property} #{case.input.number}",
      "assert.are.equal #{case.expected}, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
