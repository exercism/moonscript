int_list = (list) -> "{#{table.concat list, ', '}}"

{
  module_name: 'SimpleLinkedList',

  generate_test: (case, level) ->
    lines = {}

    if case.input.initialValues
      table.insert lines, "list = SimpleLinkedList #{int_list case.input.initialValues}"
    else
      table.insert lines, "list = SimpleLinkedList!"

    for op in *case.input.operations
      if op.value
        table.insert lines, "list\\#{op.operation} #{op.value}"

      elseif not op.expected
        table.insert lines, "list\\#{op.operation}!"

      elseif type(op.expected) != 'table'
        table.insert lines, "result = list\\#{op.operation}!"
        table.insert lines, "assert.are.equal #{op.expected}, result"

      elseif op.expected.error
        table.insert lines, "f = -> list\\#{op.operation}!"
        table.insert lines, "assert.has.error f, #{quote op.expected.error}"

      else
        table.insert lines, "result = list\\#{op.operation}!"
        table.insert lines, "assert.are.same #{int_list op.expected}, result"

    table.concat [indent line, level for line in *lines], '\n'

  exclusions: {
    {key: 'description', value: 'toList LIFO'}
  }
}
