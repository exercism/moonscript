string_list = (list) -> "{#{table.concat [quote(v) for v in *list], ', '}}"

{
  module_name: 'Etl',

  generate_test: (case, level) ->
    lines = {}

    table.insert lines, "legacy = {"
    for k, v in pairs case.input.legacy
      table.insert lines, "  #{quote k}: #{string_list v}"
    table.insert lines, "}"

    table.insert lines, "expected = {"
    for k, v in pairs case.expected
      table.insert lines, "  #{quote k}: #{v}"
    table.insert lines, "}"

    table.insert lines, "result = Etl.#{case.property} legacy"
    table.insert lines, "assert.are.same expected, result"

    table.concat [indent line, level for line in *lines], '\n'
}
