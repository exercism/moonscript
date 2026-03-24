list_of_words = (list) ->
  "{#{table.concat [quote word for word in *list], ', '}}"

{
  module_imports: {'slices'},

  generate_test: (case, level) ->
    cmd = "slices #{quote case.input.series}, #{case.input.sliceLength}"

    local lines
    if case.expected.error
      lines = {
        "f = -> #{cmd}"
        "assert.has_error f, #{quote case.expected.error}"
      }
    else
      lines = {
        "result = [s for s in #{cmd}]"
        "expected = #{list_of_words case.expected}"
        "assert.are.same expected, result"
      }
    table.concat [indent line, level for line in *lines], '\n'
}
