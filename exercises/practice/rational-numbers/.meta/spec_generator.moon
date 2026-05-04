import indent, int_list from require 'spec_helpers'

{
  module_name: 'rational',

  generate_test: (case, level) ->
    local lines

    switch case.property
      when 'add', 'sub', 'mul', 'div'
        lines = {
          "result = rational.#{case.property} #{int_list case.input.r1}, #{int_list case.input.r2}",
          "expected = #{int_list case.expected}",
          "assert.are.same expected, result"
        }
      when 'abs', 'reduce'
        lines = {
          "result = rational.#{case.property} #{int_list case.input.r}",
          "assert.are.same #{int_list case.expected}, result"
        }
      when 'exprational'
        lines = {
          "result = rational.#{case.property} #{int_list case.input.r}, #{case.input.n}",
          "assert.are.same #{int_list case.expected}, result"
        }
      when 'expreal'
        lines = {
          "result = rational.#{case.property} #{case.input.x}, #{int_list case.input.r}",
          "assert.is.near #{case.expected}, result, 1e-6"
        }
    table.concat [indent line, level for line in *lines], '\n'
}
