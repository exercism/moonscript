json = require 'dkjson'

{
  module_name: 'Bob',
  generate_test: (case, level) ->
    lines = {
      "result = Bob.hey #{json.encode case.input.heyBob}",
      "assert.is.equal #{quote case.expected}, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
