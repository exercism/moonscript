
{
  module_name: 'SpaceAge',

  test_helpers: [[
  -- ----------------------------------------
  epsilon = 1e-2
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

    if type(case.expected) == "table"
      lines = {
        "f = -> SpaceAge.age #{quote case.input.planet}, #{case.input.seconds}",
        "assert.has.errors f, #{quote case.expected.error}"
      }
    else
      lines = {
        "result = SpaceAge.age #{quote case.input.planet}, #{case.input.seconds}",
        "assert.approx_equal #{case.expected}, result"
      }
    table.concat [indent line, level for line in *lines], '\n'
}
