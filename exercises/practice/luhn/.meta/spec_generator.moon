{
  module_name: 'Luhn',

  generate_test: (case, level) ->
    indent "assert.is_#{case.expected} Luhn.is_valid #{quote case.input.value}", level
}
