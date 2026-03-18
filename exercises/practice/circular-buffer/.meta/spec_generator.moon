{
  module_name: 'CircularBuffer',

  generate_test: (case, level) ->
    lines = { "buffer = CircularBuffer #{case.input.capacity}" }
    for op in *case.input.operations
      switch op.operation
        when 'read'
          table.insert lines, 'value, ok = buffer\\read!'
          table.insert lines, "assert.is_#{op.should_succeed} ok"
          if op.should_succeed
            table.insert lines, "assert.are.equal #{op.expected}, value"

        when 'write'
          table.insert lines, "ok = buffer\\write #{op.item}"
          table.insert lines, "assert.is_#{op.should_succeed} ok"

        when 'clear'
          table.insert lines, 'buffer\\clear!'

        when 'overwrite'
          table.insert lines, "buffer\\write #{op.item}, overwrite: true"

    table.concat [indent line, level for line in *lines], '\n'
}
