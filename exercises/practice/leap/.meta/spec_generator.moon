{
  module_name: 'is_leap_year',
  generate_test: (case, level) ->
    indent "assert.is_#{case.expected} is_leap_year #{case.input.year}", level
}
