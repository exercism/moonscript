int_list = (list) -> "{#{table.concat list, ', '}}"

{
  module_name: 'rational',

  test_helpers: [[
  -- ----------------------------------------
  -- Why do we need to test "approximately equal"?
  -- See https://0.30000000000000004.com
  epsilon = 1e-9
  is_close_to = (state, arguments) ->
    {a, b} = arguments
    math.abs(a - b) <= epsilon

  say = require 'say'
  say\set 'assertion.approx_equal.positive', "Expected %s and %s to be within #{epsilon}"
  say\set 'assertion.approx_equal.negative', "Expected %s and %s not to be within #{epsilon}"
  assert\register 'assertion', 'approx_equal', is_close_to, 'assertion.approx_equal.positive', 'assertion.approx_equal.negative'
  -- ----------------------------------------
]]

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
          "assert.approx_equal #{case.expected}, result"
        }
    table.concat [indent line, level for line in *lines], '\n'
}
