# Reusable stuff for spec generators

## Functions in generate-spec script

These functions are exported from generate-spec for use in spec_generator modules

- `indent(text, level)` -- provide leading whitespace to the appropriate level.
- `quote(str)` -- add quotation marks to the string, single or double as appropriate.
- `is_empty(tbl)` -- predicate: is the table empty
- `is_json_null(value)` -- predicate: is the value `json.null` from dkjson
- `contains(tbl, value)` -- predicate: does the table contain the value (uses `==`)

## Helper functions

Useful for generating pretty tables mostly.
The functions are stored in `/lib/test_helpers.md`

An example:

```moonscript
test_helpers = require 'test_helpers'
import int_list, word_list from test_helpers
...
generate_test: (case, level) ->
  lines = {
    "input = #{int_list case.input.numbers}"
    "expected = #{word_list case.expected}"
    ...
```

## Comparing tables deeply

The `assert.are.same t1, t2` assertion is used to compare tables deeply.
However when they don't match, by default busted does not show the whole object, which makes it hard for the student: "What is different?"

```shnone
Failure → ./rest_api_spec.moon @ 251
rest-api iou lender owes borrower less than new loan
...uarocks/lib/luarocks/rocks-5.4/busted/2.3.0-1/bin/busted:7: Expected objects to be the same.
Passed in:
(table: 0x641e0548a540) {
 *[users] = {
    [1] = {
      [balance] = 1.0
      [name] = 'Adam'
      [owed_by] = { ... more }
      [owes] = { } }
   *[2] = {
      [balance] = -1.0
      [name] = 'Bob'
      [owed_by] = { }
     *[owes] = { ... more } } } }
Expected:
(table: 0x641e0548a620) {
 *[users] = {
    [1] = {
      [balance] = 1.0
      [name] = 'Adam'
      [owed_by] = { ... more }
      [owes] = { } }
   *[2] = {
      [balance] = -1.0
      [name] = 'Bob'
      [owed_by] = { }
     *[owes] = { ... more } } } }
```

The solution here is to configure the `assert` object,.
In the spec_generator.moon module, add this (adjust the value `4` as needed):

```none
  -- we have deep tables to compare, display it all when not the same
  test_helpers: [[
  assert\set_parameter "TableFormatLevel", 4
]]
```

## Custom assertions

- dnd-character: `assert.between value, min, max`
- space-age: `assert.approx_equal #{case.expected}, result`
- word-count: `assert.has.same_kv result, expected`
