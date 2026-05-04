import indent, quote from require 'spec_helpers'

{
  module_name: 'MicroBlog',
  generate_test: (case, level) ->
    lines = {
      "result = MicroBlog.#{case.property} #{quote case.input.phrase}",
      "assert.are.equal #{quote case.expected}, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
