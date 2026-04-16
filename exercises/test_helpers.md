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

### List of ints

```moonscript
int_list = (list) -> "{#{table.concat list, ', '}}"
```

Used in: all-your-base

### List of lists of ints

```moonscript
int_lists = (lists, level) ->
  if #lists == 1
    "{#{int_list lists[1]}}"
  else
    rows = [indent int_list(row) .. ',', level + 1 for row in *lists]
    table.insert rows, 1, '{'
    table.insert rows, indent '}', level
    table.concat rows, '\n'
```

Used in: saddle-points, spiral-matrix

### List of strings

```moonscript
string_list = (list) ->
  "{#{table.concat [quote word for word in *list], ', '}}"
```
The `quote` function is defined in bin/generate-spec

Used in: anagram

### Indented multi-line list of strings

```moonscript
instruction_list = (list, level) ->
  if #list <= 2
    "{#{table.concat [quote elem for elem in *list], ', '}}"
  else
    instrs = [indent quote(elem) .. ',', level + 1 for elem in *list]
    table.insert instrs, 1, '{'
    table.insert instrs, indent('}', level)
    table.concat instrs, '\n'
```
The `indent` function is defined in bin/generate-spec

This returns a multi-line string without the first line indented.
The returned string will be added to another string in the test case body,
and then that string (without regard to internal newlines) will later be indented.

Used in: forth, transpose

### Key-Value list

```moonscript
kv_table = (tbl, level) ->
  lines = {'{'}
  for k, v in pairs tbl
    key = if k\match('^%a%w*$') then k else "[#{quote k}]"
    table.insert lines, indent "#{key}: #{v},", level + 1
  table.insert lines, indent '}', level
  table.concat lines, '\n'
```

Used in: word-count

### key-value table as a one-line string

```moonscript
table.tostring = (t) ->
  s = [string.format '%s: %q', k, v for k, v in pairs t]
  "{#{table.concat s, ', '}}"
```

Reminder: order of keys in indeterminate

Used in: meetup

### Show strings with escapes, when you want to keep the `\t`, `\n` in the test case.

```moonscript
json = require 'dkjson'
-- and then
  "result = Bob.hey #{json.encode case.input.heyBob}",
```
```moonscript
json = require 'dkjson'
json_string = (s) -> json.encode s
```

Used in: bob, matrix

### Table contains an element

```moonscript
table_contains = (list, target) ->
  for elem in *list
    return true if elem == target
  false
```

Used in: forth

### Wrapped list of ints

sieve has a test with loads of numbers.
This _should_ work fine on Mac or Linux ("Works For Me™)

```moonscript
formatted = (list, level) ->
  joined = table.concat list, ', '
  cmd = "echo '#{joined}' | fold -s -w 76"
  fh = io.popen cmd, 'r'
  return "{#{joined}}" if not fh

  lines = [indent(line\gsub('%s+$', ''), level + 1) for line in fh\lines!]

  result = {fh\close!}
  lines = {joined} if not result[1]

  if #lines == 1
    "{#{lines[1]\gsub('^%s+', '')}}"
  else
    table.insert lines, 1, "{"
    table.insert lines, (indent "}", level)
    table.concat lines, '\n'
```

### Arbitrarily deep nested tables

The sgf-parsing exercises produces recursively nested structures.
I came up with this (which could probably be refactored)

```moonscript
json = require 'dkjson'
json_string = (s) -> json.encode s

is_sequence = (t) ->
  return false if type(t) != 'table'
  size = 0
  size += 1 for k, _ in pairs t when k != 'n'
  size == #t

is_empty = (t) -> not next t

-- mostly taken from:
-- https://github.com/leafo/moonscript/blob/7b7899741c6c1e971e436d36c9aabb56f51dc3d5/moonscript/util.moon#L58
to_string = (what, level = 0) ->
  seen = {}
  _dump = (what, depth = 0) ->
    t = type what
    if t == 'string' then
      json_string what
    elseif t != 'table' then
      tostring what
    else
      if seen[what] then
        return "<cycle:#{tostring what}>"
      seen[what] = true
      if is_sequence what then
        return "{" .. table.concat([to_string(v, level + depth + 1) for v in *what], ", ") .. "}"

      depth += 1
      lines = for k,v in pairs what do
        key = if type(k) == 'number' then "[#{k}]" else k
        (' ')\rep(depth * 2) .. "#{key}: " .. _dump(v, depth)
      seen[what] = false
      val = if not is_empty lines
        table.concat [indent(line, level) .. "\n" for line in *lines]
      else
        ""
      class_name = if type(what.__class) == 'table' and type(what.__class.__name) == 'string'
        "<#{what.__class.__name}>"
      "#{class_name or ""}{\n#{val}#{indent '}', level + depth - 1}"
  _dump what
```

## Custom assertions

- dnd-character: `assert.between value, min, max`
- space-age: `assert.approx_equal #{case.expected}, result`
- word-count: `assert.has.same_kv result, expected`

