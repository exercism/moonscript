{
  module_name: 'LinkedList',

  generate_test: (case, level) ->
    lines = {
      "list = LinkedList!",
    }
    for op in *case.input.operations
      if op.value
        table.insert lines, "list\\#{op.operation} #{op.value}"
      elseif op.expected
        table.insert lines, "assert.are.equal #{op.expected}, list\\#{op.operation}!"
      else
        table.insert lines, "list\\#{op.operation}!"

    table.concat [indent line, level for line in *lines], '\n'
}
