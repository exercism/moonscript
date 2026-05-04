import indent, quote from require 'spec_helpers'

{
  module_name: 'SpaceAge',

  generate_test: (case, level) ->
    local lines

    if type(case.expected) == "table"
      lines = {
        "f = -> SpaceAge.age #{quote case.input.planet}, #{case.input.seconds}",
        "assert.has.errors f, #{quote case.expected.error}"
      }
    else
      lines = {
        "result = SpaceAge.age #{quote case.input.planet}, #{case.input.seconds}",
        "assert.is.near #{case.expected}, result, 0.01"
      }
    table.concat [indent line, level for line in *lines], '\n'
}
