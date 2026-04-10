string_list = (list) ->
  "{#{table.concat [quote word for word in *list], ', '}}"

{
  module_imports: {'proteins'},

  generate_test: (case, level) ->
    local lines
    if case.expected.error
      lines = {
        "f = -> proteins #{quote case.input.strand}",
        "assert.has.errors f, #{quote case.expected.error}"
      }
    else
      lines = {
        "result = proteins #{quote case.input.strand}",
        "expected = #{string_list case.expected}",
        "assert.are.same expected, result"
      }
    table.concat [indent line, level for line in *lines], '\n'
}
