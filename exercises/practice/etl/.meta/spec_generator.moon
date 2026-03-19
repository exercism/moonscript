string_list = (list) -> "{#{table.concat [quote(v) for v in *list], ', '}}"

{
  module_name: 'Etl',

  generate_test: (case, level) ->
    lines = {}

    table.insert lines, "legacy = {"
    keys = [k for k, _ in pairs case.input.legacy]
    table.sort keys
    for k in *keys
      table.insert lines, "  #{quote k}: #{string_list case.input.legacy[k]}"
    table.insert lines, "}"

    table.insert lines, "expected = {"
    keys = [k for k, _ in pairs case.expected]
    table.sort keys
    for k in *keys
      table.insert lines, "  #{quote k}: #{case.expected[k]}"
    table.insert lines, "}"

    table.insert lines, "result = Etl.#{case.property} legacy"
    table.insert lines, "assert.are.same expected, result"

    table.concat [indent line, level for line in *lines], '\n'
}
