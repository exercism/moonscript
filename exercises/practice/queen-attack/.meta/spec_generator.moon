{
  module_name: 'Queen',
  test_helpers: [[
  -- Valid values for rows and columns are: 0 to 7 inclusive.
]]

  generate_test: (case, level) ->
    local lines
    switch case.property
      when 'create'
        {:row, :column} = case.input.queen.position
        if type(case.expected) == 'number'
          lines = {
            "queen = Queen #{row}, #{column}",
            "assert.is.truthy queen"
          }
        else
          lines = {
            "f = -> Queen #{row}, #{column}",
            "assert.has.errors f, 'invalid position'"
          }

      when 'canAttack'
        {row: br, column: bc} = case.input.black_queen.position
        {row: wr, column: wc} = case.input.white_queen.position
        lines = {
          "black_queen = Queen #{br}, #{bc}",
          "white_queen = Queen #{wr}, #{wc}",
          "assert.is_#{case.expected} black_queen\\can_attack white_queen"
        }

    table.concat [indent line, level for line in *lines], '\n'
}
