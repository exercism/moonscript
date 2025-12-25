{
  module_imports: {'is_paired'},
  generate_test: (case, level) ->
    indent "assert.is_#{case.expected} is_paired #{quote case.input.value\gsub('\\', '\\\\')}", level
}
