import indent, quote from require 'spec_helpers'

{
    module_name: "raindrops",
    generate_test: (case, level) -> 
      lines = {
        "result = raindrops #{case.input.number}"
        "assert.are.equal #{quote case.expected}, result"
      }
      table.concat [indent line, level for line in *lines], '\n'
}
