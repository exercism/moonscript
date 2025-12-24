{
  module_imports: {'is_equilateral', 'is_isosceles', 'is_scalene'},
  generate_test: (case, level) ->
    indent "assert.is_#{case.expected} is_#{case.property}(#{table.concat case.input.sides, ', '})", level
}
