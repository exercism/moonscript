json = require 'dkjson'

-- example usage in a spec_generator:
--    import int_list, word_list from require 'test_helpers'

--- -----------------------------------------------------------------------
--- Lists of booleans
bool_list = (list) -> "{#{table.concat [tostring b for b in *list], ', '}}"

--- List of ints
int_list = (list) -> "{#{table.concat list, ', '}}"

--- List of lists of ints
int_lists = (lists, level) ->
  error 'Provide a level for `int_lists`', 2 if not level
  if #lists == 0
    '{}'
  elseif #lists == 1
    "{#{int_list lists[1]}}"
  else
    rows = [indent int_list(row) .. ',', level + 1 for row in *lists]
    table.insert rows, 1, '{'
    table.insert rows, indent '}', level
    table.concat rows, '\n'

--- Wrapped list of ints
-- Example, sieve has a test with loads of numbers.
-- This _should_ work fine on Mac or Linux ("Works For Me™)
int_list_wrapped = (list, level) ->
  error 'Provide a level for `int_list_wrapped`', 2 if not level
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

--- -----------------------------------------------------------------------
--- List of strings
word_list = (list) ->
  "{#{table.concat [quote word for word in *list], ', '}}"

--- Indented multi-line list of strings
-- This returns a multi-line string without the first line indented.
-- The returned string will be added to another string in the test case body,
-- and then that string (without regard to internal newlines) will later be indented.
string_list = (list, level, opts) ->
  error 'Provide a level for `string_list`', 2 if not level
  opts = opts or {inline: 2}
  if #list <= opts.inline
    "{#{table.concat [quote elem for elem in *list], ', '}}"
  else
    lines = [indent quote(elem) .. ',', level + 1 for elem in *list]
    table.insert lines, 1, '{'
    table.insert lines, indent('}', level)
    table.concat lines, '\n'

--- Show strings with escapes, when you want to keep the `\t`, `\n` in the test case.
json_string = (s) -> json.encode s

--- -----------------------------------------------------------------------
--- Key-Value list
kv_table = (tbl, level) ->
  error 'Provide a level for `kv_table`', 2 if not level
  lines = {'{'}
  for k, v in pairs tbl
    key = if math.type(k) == "integer"
      "[#{k}]"
    elseif k\match('^%a%w*$') 
      k
    else
      quote k
    table.insert lines, indent "#{key}: #{v},", level + 1
  table.insert lines, indent '}', level
  table.concat lines, '\n'

--- key-value table as a one-line string
-- Reminder: order of keys in indeterminate.
-- Note that `%q` renders floats in a hex format: -6.429 => -0x1.9b74bc6a7ef9ep+2
table_tostring = (t) ->
  s = [string.format '%s: %q', k, v for k, v in pairs t]
  "{#{table.concat s, ', '}}"

table_tostring_ordered = (t, keys) ->
  s = [string.format '%s: %q', k, t[k] for k in *keys]
  "{#{table.concat s, ', '}}"

--- list of one-line key-value tables
table_list = (list, level) ->
  error 'Provide a level for `table_list`', 2 if not level
  if #list <= 1
    "{#{table.concat [table_tostring elem for elem in *list], ', '}}"
  else
    lines = [indent table_tostring(elem) .. ',', level + 1 for elem in *list]
    table.insert lines, 1, '{'
    table.insert lines, indent('}', level)
    table.concat lines, '\n'

--- Table contains an element
table_contains = (list, target) ->
  for elem in *list
    return true if elem == target
  false

--- -----------------------------------------------------------------------
--- Arbitrarily deep nested tables

is_sequence = (t) ->
  return false if type(t) != 'table'
  size = 0
  size += 1 for k, _ in pairs t when k != 'n'
  size == #t

is_empty = (t) -> not next t

-- mostly taken from:
-- https://github.com/leafo/moonscript/blob/7b7899741c6c1e971e436d36c9aabb56f51dc3d5/moonscript/util.moon#L58
table_dump = (what, level = 0) ->
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
        return "{" .. table.concat([table_dump(v, level + depth + 1) for v in *what], ", ") .. "}"

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

--- -----------------------------------------------------------------------
{
  :bool_list
  :int_list
  :int_lists
  :int_list_wrapped
  :word_list
  :string_list
  :kv_table
  :table_tostring
  :table_tostring_ordered
  :table_list
  :json_string
  :table_contains
  :table_dump
}
