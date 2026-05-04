-- Custom assertions
--
-- pull them into the spec_generator like this: (see `dnd-character`)
--
--     import ident, ... from require 'spec_helpers'
--     assertions = require 'spec_helpers/assertions'
--     ...
--     generate_test = (case, level) ->
--       ...
--       test_helpers = assertions.between
--       ...

assertions = {
  between: [[
  -- ----------------------------------------------------------
  between = (state, arguments) ->
    assert #arguments == 3, 'expected three arguments to assert.between: value, min, max'
    { val, min, max } = arguments
    val and min <= val and val <= max

  say = require 'say'
  say\set 'assertion.between.positive', 'Expected %s to be in the range [%s, %s]'
  say\set 'assertion.between.negative', 'Expected %s not to be in the range [%s, %s]'
  assert\register 'assertion', 'between', between, 'assertion.between.positive', 'assertion.between.negative'
  -- ----------------------------------------------------------
]]

}

assertions
