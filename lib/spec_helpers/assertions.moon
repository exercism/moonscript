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
]],

  same_elements: [[
  -- ----------------------------------------------------------
  -- assert that two lists have the same elements, regardless of order
  same_elements = (state, arguments) ->
    { list1, list2 } = arguments
    return false if #list1 != #list2
    for elem in *list1
      found = false
      for elem2 in *list2
        if elem == elem2
          found = true
          break
      return false if not found
    true

  say = require 'say'
  say\set 'assertion.same_elements.positive', 'Expected %s to be in the range [%s, %s]'
  say\set 'assertion.same_elements.negative', 'Expected %s not to be in the range [%s, %s]'
  assert\register 'assertion', 'same_elements', same_elements, 'assertion.same_elements.positive', 'assertion.same_elements.negative'
  -- ----------------------------------------------------------
]]

}

assertions
