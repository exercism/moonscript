{
  module_imports: {'translate'},
  generate_test: (case, level) ->
    body = "assert.are.equal #{quote case.expected}, translate #{quote case.input.phrase}"
    indent body, level
}
