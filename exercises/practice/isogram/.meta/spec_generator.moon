{
  module_imports: {'is_isogram'},
  generate_test: (case, level) ->
    indent "assert.is_#{case.expected} is_isogram #{quote case.input.phrase}", level
}
