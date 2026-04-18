{
  module_imports: {'classify'},

  generate_test: (case, level) ->
    lines = if case.expected.error
      {
        "func = -> #{case.property} #{case.input.number}",
        "assert.has.error func, #{quote case.expected.error}"
      }
    else
      {
        "assert.are.equal #{quote case.expected}, #{case.property} #{case.input.number}"
      }
    table.concat [indent line, level for line in *lines], '\n'
}
