{
  module_name: 'Isbn10',
  generate_test: (case, level) ->
    indent "assert.is_#{case.expected} Isbn10.is_valid #{quote case.input.isbn}", level
}
