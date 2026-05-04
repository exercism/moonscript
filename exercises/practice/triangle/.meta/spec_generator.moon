import indent from require 'spec_helpers'

{
  module_imports: {'is_equilateral', 'is_isosceles', 'is_scalene'},
  generate_test: (case, level) ->
    func = "is_#{case.property}(#{table.concat case.input.sides, ', '})"
    indent "assert.is_#{case.expected} #{func}", level
}
