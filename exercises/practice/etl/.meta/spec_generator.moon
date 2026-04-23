import word_list from require 'test_helpers'

{
  module_name: 'Etl',

  generate_test: (case, level) ->
    lines = {}

    table.insert lines, "legacy = {"
    keys = [k for k, _ in pairs case.input.legacy]
    table.sort keys
    for k in *keys
      table.insert lines, "  #{quote k}: #{word_list case.input.legacy[k]}"
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
