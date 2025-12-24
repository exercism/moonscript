{
  module_imports: {'largest_product'},

  generate_test: (case, level) ->
    lines = {}
    switch type(case.expected)
      when 'number'
        table.insert lines, "-- #{line}" for line in *(case.comments or {})
        table.insert lines, line for line in *{
          "result = largest_product #{quote case.input.digits}, #{case.input.span}",
          "assert.are.equal #{case.expected}, result"
        }
      when 'table'
        lines = {
          "f = -> largest_product #{quote case.input.digits}, #{case.input.span}",
          "assert.has.errors f, #{quote case.expected.error}"
        }

    table.concat [indent line, level for line in *lines], '\n'
}
