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


{
  module_name: 'Sieve',

  generate_test: (case, level) ->
    lines = {
      "result = Sieve.#{case.property} #{case.input.limit}",
      "expected = #{formatted case.expected, level}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
