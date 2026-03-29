table.tostring = (t) ->
  s = [string.format '%s: %q', k, v for k, v in pairs t]
  "{#{table.concat s, ', '}}"

{
  module_imports: {'meetup'},

  generate_test: (case, level) ->
    lines = {
      "result = meetup #{table.tostring case.input}"
      "expected = #{quote case.expected}"
      "assert.are.equal expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
