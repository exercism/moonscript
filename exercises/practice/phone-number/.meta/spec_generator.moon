{
  module_imports: {'clean'},

  generate_test: (case, level) ->
    local lines
    if case.expected.error
      lines = {
        "f = -> clean #{quote case.input.phrase}",
        "assert.has.error f, #{quote case.expected.error}"
      }
    else
      lines = {
        "result = clean #{quote case.input.phrase}",
        "assert.is.equal #{quote case.expected}, result"
      }
    table.concat [indent line, level for line in *lines], '\n'
}
