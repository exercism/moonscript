{
  module_name: 'MicroBlog',
  generate_test: (case, level) ->
    lines = {
      "result = MicroBlog.#{case.property} '#{case.input.phrase}'",
      "assert.are.equal '#{case.expected}', result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
