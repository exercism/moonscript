{
  module_name: 'BinarySearch',
  test_helpers: [[
  -- Remember, Lua (and MoonScript) use 1-based indexing.
  ]]
  generate_test: (case, level) ->
    local lines
    if type(case.expected) == 'number'
      -- the success tests are expecting zero-based indexing; adjust.
      lines = {
        "list = {#{table.concat case.input.array, ', '}}",
        "index = BinarySearch.find list, #{case.input.value}",
        "assert.are.equal #{case.expected + 1}, index"
      }
    else
      lines = {
        "list = {#{table.concat case.input.array, ', '}}",
        "f = -> BinarySearch.find list, #{case.input.value}",
        "assert.has.errors f, #{quote case.expected.error}"
      }

    table.concat [indent line, level for line in *lines], '\n'
}
