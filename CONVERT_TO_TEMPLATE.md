# Converting Exercises from `spec_generator.moon` to `generator.tmpl`

This document describes the process for migrating exercises from the old
`spec_generator.moon` approach to the new `etlua`-based `generator.tmpl` approach.

## Overview

Each exercise that has a `.meta/spec_generator.moon` file needs to be converted
to use a `.meta/generator.tmpl` file instead. The generator script `bin/generate-spec`
uses `etlua` to render the template into the spec file.

## Steps for Each Exercise

1. **Read the existing spec file** (`exercises/practice/<slug>/<snake>_spec.moon`)
   to understand the expected output format.

2. **Read the existing `spec_generator.moon`** to understand what inputs are used
   and how the test body is constructed.

3. **Fetch the canonical data** (if not already cached in `canonical-data/`):
   ```sh
   curl -s https://raw.githubusercontent.com/exercism/problem-specifications/main/exercises/<slug>/canonical-data.json
   ```
   Note the structure: flat `cases` array, or nested groups with `cases` inside each group.

4. **Create `.meta/generator.tmpl`** — see template patterns below.

5. **Run the generator** and verify the output matches the existing spec:
   ```sh
   bin/generate-spec <slug>
   ```

6. **Verify the tests pass**:
   ```sh
   bin/verify-exercises <slug>
   ```

7. **Delete the old `spec_generator.moon`**:
   ```sh
   rm exercises/practice/<slug>/.meta/spec_generator.moon
   ```

---

## Template Syntax Reference

The template uses `etlua` tags:

- `<% lua statements %>` — control flow (loops, conditionals)
- `<%= lua expression %>` — output (HTML-escaped)
- `<%- lua expression %>` — output (raw, no escaping) — use for quoted strings
- `-%>` — suppress trailing newline after the tag

**Important:** Use Lua syntax inside tags (not MoonScript):
- `function()` not `->`, parentheses required for calls
- `for k, v in ipairs(t) do ... end` not `for k, v in *t`
- `if ... then ... end`

---

## Template Environment Variables

| Variable | Description |
|---|---|
| `data` | Parsed canonical data (the full JSON object) |
| `data.cases` | Array of test cases (may be flat or nested groups) |
| `slug.kebab` | Exercise name as-is, e.g. `difference-of-squares` |
| `slug.snake` | Snake case, e.g. `difference_of_squares` |
| `slug.pascal` | Pascal case, e.g. `DifferenceOfSquares` |
| `h` | The `spec_helpers` module (see `lib/spec_helpers.moon`) |
| `test_cmd` | Function: `test_cmd(bool)` returns `"it"` or `"pending"` |

---

## Helper Functions (`h.*`)

| Function | Description |
|---|---|
| `h.quote(str)` | Safely quote a string (uses `'` or `"` as needed) |
| `h.int_list(list)` | Format a list of ints: `{1, 2, 3}` |
| `h.int_lists(list, level)` | Format a list of int-pairs (e.g. dominoes), multi-line if > 2 items |
| `h.string_list(list, level)` | Format a list of strings, multi-line if > 2 items |
| `h.word_list(list)` | Format a list of strings inline: `{'a', 'b'}` |
| `h.bool_list(list)` | Format a list of booleans |

---

## Common Template Patterns

### Pattern 1: Flat cases, simple module (snake_case name)

Used when: module is required with snake_case name (e.g. `darts`, `dominoes`).

```etlua
<%= slug.snake %> = require <%- h.quote(slug.snake) %>

describe <%- h.quote(slug.kebab .. ':') %>, ->
<% for i, case in ipairs(data.cases) do -%>
  <%= test_cmd(i == 1) %> <%- h.quote(case.description) %>, ->
    result = <%= slug.snake %>.<%= case.property %> ...inputs...
    assert.are.equal <%= case.expected %>, result

<% end -%>
```

### Pattern 2: Flat cases, PascalCase module

Used when: module is required with PascalCase name (e.g. `Diamond`, `Bob`).

```etlua
<%= slug.pascal %> = require <%- h.quote(slug.snake) %>

describe <%- h.quote(slug.kebab .. ':') %>, ->
<% for i, case in ipairs(data.cases) do -%>
  <%= test_cmd(i == 1) %> <%- h.quote(case.description) %>, ->
    result = <%= slug.pascal %>.<%= case.property %> ...inputs...
    assert.are.equal <%= case.expected %>, result

<% end -%>
```

### Pattern 3: Nested groups (cases inside groups)

Used when: canonical data has groups, each with their own `cases` array
(e.g. `difference-of-squares`, `custom-set`).

Use `i == 1 and j == 1` to mark only the very first test overall as `it`.

```etlua
<%= slug.pascal %> = require <%- h.quote(slug.snake) %>

describe <%- h.quote(slug.kebab .. ':') %>, ->
<% for i, group in ipairs(data.cases) do -%>
  describe <%- h.quote(group.description .. ':') %>, ->
<%   for j, case in ipairs(group.cases) do -%>
    <%= test_cmd(i == 1 and j == 1) %> <%- h.quote(case.description) %>, ->
      ...test body...

<%   end -%>
<% end -%>
```

### Pattern 4: camelCase property → snake_case method name

Used when: canonical data uses camelCase property names (e.g. `squareOfSum`)
but MoonScript uses snake_case (e.g. `square_of_sum`).

Define a `snakify` helper in a Lua block at the top of the template:

```etlua
<%
  local function snakify(s)
    return s:gsub("%f[A-Z].", function(c) return "_" .. c:lower() end)
  end
-%>
```

Then use it: `<%= snakify(case.property) %>`

### Pattern 5: Import syntax (instead of module table)

Used when: the spec uses `import funcName from require 'module'`.

```etlua
import funcName from require <%- h.quote(slug.snake) %>
```

### Pattern 6: Boolean expected values

Used when: `case.expected` is `true` or `false` and the assertion is `assert.is.true` / `assert.is.false`.

```etlua
assert.is.<%= tostring(case.expected) %> funcName args
```

### Pattern 7: String list expected values

Used when: `case.expected` is an array of strings (e.g. `diamond`).

```etlua
expected = <%- h.string_list(case.expected, 2) %>
assert.are.same expected, result
```

### Pattern 8: List of int-pairs (e.g. dominoes)

```etlua
dominoes = <%- h.int_lists(case.input.dominoes, 2) %>
```

---

## Formatting Notes

- Always put a blank line between test cases (before the `<% end -%>` of the inner loop).
- Use `-%>` on `end` tags to suppress blank lines from control structures.
- Use `<%- ... %>` (with dash) for any output containing quoted strings to avoid HTML escaping.
- The `level` parameter for `string_list`, `int_lists`, etc. refers to the indentation
  level of the surrounding code (2 = inside `describe`, 3 = inside nested `describe`).

---

## Completed Exercises

- [x] `bob` — flat cases, PascalCase module, string input/output
- [x] `darts` — flat cases, snake_case module, float inputs, int expected
- [x] `diamond` — flat cases, PascalCase module, string input, string list expected
- [x] `difference-of-squares` — nested groups, PascalCase module, camelCase→snake_case property
- [x] `dominoes` — flat cases, import syntax, int-pair list input, boolean expected

## Exercises Still To Convert

Search for remaining exercises with `spec_generator.moon`:

```sh
find exercises/practice -name 'spec_generator.moon' | sort
```
