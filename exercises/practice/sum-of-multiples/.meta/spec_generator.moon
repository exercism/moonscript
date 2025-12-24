int_list = (list) -> "{#{table.concat list, ', '}}"

{
  module_name: 'SumOfMultiples',

  generate_test: (case, level) ->
    lines = {
      "result = SumOfMultiples.#{case.property} #{int_list case.input.factors}, #{case.input.limit}",
      "assert.are.equal #{case.expected}, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
