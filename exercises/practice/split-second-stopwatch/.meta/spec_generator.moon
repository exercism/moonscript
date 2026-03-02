format_expected = (val) ->
  if type(val) != 'table'
    quote val -- for state string
  elseif #val == 0
    "{}" -- for empty previous laps
  else
    "{ #{table.concat [quote v for v in *val], ', '} }" -- for non-empty previous laps

camel_case = (str) ->
  str\gsub "_(%l)", (l) -> l\upper!

{
  module_name: 'SplitSecondStopwatch'

  generate_test: (case, level) ->
    lines = { "stopwatch = SplitSecondStopwatch.Stopwatch!" }
    for i = 2, #case.input.commands
      cmd = case.input.commands[i]
      name = camel_case cmd.command
      action = "stopwatch\\#{name}#{if not cmd.by then "!" else " #{quote cmd.by}"}"

      line = if cmd.expected and cmd.expected.error
        "assert.has_error (-> #{action}), #{quote cmd.expected.error}"
      elseif cmd.expected != nil
        "assert.same #{format_expected cmd.expected}, #{action}"
      else
        action
      table.insert lines, line
    table.concat [indent line, level for line in *lines], '\n'
}
