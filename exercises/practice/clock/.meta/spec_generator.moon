{
  module_name: 'Clock',
  generate_test: (case, level) ->
    local lines

    switch case.property
      when 'create'
        lines = {
          "clock = Clock hour: #{case.input.hour}, minute: #{case.input.minute}",
          "assert.are.equal #{quote case.expected}, tostring clock"
        }
      when 'add'
        lines = {
          "clock = Clock hour: #{case.input.hour}, minute: #{case.input.minute}",
          "clock\\add #{case.input.value}",
          "assert.are.equal #{quote case.expected}, tostring clock"
        }
      when 'subtract'
        lines = {
          "clock = Clock hour: #{case.input.hour}, minute: #{case.input.minute}",
          "clock\\subtract #{case.input.value}",
          "assert.are.equal #{quote case.expected}, tostring clock"
        }
      when 'equal'
        lines = {
          "a = Clock hour: #{case.input.clock1.hour}, minute: #{case.input.clock1.minute}",
          "b = Clock hour: #{case.input.clock2.hour}, minute: #{case.input.clock2.minute}",
          "assert.is_#{case.expected}, a\\equals(b)"
        }

    table.concat [indent line, level for line in *lines], '\n'
}
