{
  module_name: 'Robot',

  generate_test: (case, level) ->
    local lines
    switch case.property
      when 'create'
        lines = {
          "robot = Robot x: #{case.input.position.x}, y: #{case.input.position.y}, direction: #{quote case.input.direction}",
          "assert.are.equal #{case.expected.position.x}, robot\\x!",
          "assert.are.equal #{case.expected.position.y}, robot\\y!",
          "assert.are.equal #{quote case.expected.direction}, robot\\direction!"
        }

      when 'move'
        lines = {
          "robot = Robot x: #{case.input.position.x}, y: #{case.input.position.y}, direction: #{quote case.input.direction}",
          "robot\\move #{quote case.input.instructions}",

          "assert.are.equal #{case.expected.position.x}, robot\\x!",
          "assert.are.equal #{case.expected.position.y}, robot\\y!",
          "assert.are.equal #{quote case.expected.direction}, robot\\direction!"
        }

    table.concat [indent line, level for line in *lines], '\n'
}
