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


{
  module_name: 'SGFParser',

  generate_test: (case, level) ->
    lines = if case.expected.error
      {
        "f = -> SGFParser.parse #{json_string case.input.encoded}"
        "assert.has_error f, #{quote case.expected.error}"
      }
    else
      {
        "result = SGFParser.#{case.property} #{json_string case.input.encoded}",
        "expected = #{to_string case.expected, level}",
        "assert.are.same expected, result"
      }
    table.concat [indent line, level for line in *lines], '\n'
}
