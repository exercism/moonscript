int_list = (list) -> "{#{table.concat list, ', '}}"

{
  module_imports: {'make_change'},

  generate_test: (case, level) ->
    local lines
    if case.expected.error
      lines = {
        "f = -> make_change #{case.input.target}, #{int_list case.input.coins}",
        "assert.has.error f, #{quote case.expected.error}"
      }
    else
      lines = {
        "result = make_change #{case.input.target}, #{int_list case.input.coins}",
        "expected = #{int_list case.expected}",
        "assert.are.same expected, result"
      }
    table.concat [indent line, level for line in *lines], '\n'
}
