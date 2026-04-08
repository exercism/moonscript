-- helper functions can go here at the top, like:
int_list = (list) -> "{#{table.concat list, ', '}}"
-- see `exercises/test_helpers.md` for some examples

{
  module_name: '${camel_slug}',
  -- or, module_imports: {'func1', 'func2', ...},

  generate_test: (case, level) ->
    local lines
    -- you may want to "switch case.property" here
    lines = {
      "result = ${camel_slug}.#{case.property} #{case.input}",
      "expected = #{quote case.expected}",
      "assert.are.equal expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'

  -- optional:
  test_helpers: [[
  A block of code to insert into the spec file before the tests.
  It is indented 2 spaces.
]]

  -- optional:
  bonus: [[
      pending 'bonus test description', ->
        {
          "Bonus tests are not generated:"
          "this is just a block of text inserted into the spec file."
          "Bonus tests are indented 6 spaces"
        }
]]
}
