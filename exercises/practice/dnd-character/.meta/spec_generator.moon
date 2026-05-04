import indent from require 'spec_helpers'
assertions = require 'spec_helpers.assertions'

{
  module_imports: {'modifier', 'ability', 'character'},

  test_helpers: assertions.between

  generate_test: (case, level) ->
    local lines

    switch case.property
      when 'modifier'
        lines = {
          "assert.are.equal #{case.expected}, modifier #{case.input.score}"
        }
      when 'ability'
        lines = {
          "for i = 1, 50",
          "  score = ability!",
          "  assert.is.between score, 3, 18"
        }
      when 'character'
        if case.description == "random character is valid"
          lines = {
            "player = character!",
            "assert.is.between player.strength, 3, 18",
            "assert.is.between player.dexterity, 3, 18",
            "assert.is.between player.constitution, 3, 18",
            "assert.is.between player.intelligence, 3, 18",
            "assert.is.between player.wisdom, 3, 18",
            "assert.is.between player.charisma, 3, 18",
            "assert.are.equal (10 + modifier player.constitution), player.hitpoints"
          }
        else
          lines = {
            "player = character!",
            "assert.are.equal player.strength, player.strength",
            "assert.are.equal player.dexterity, player.dexterity",
            "assert.are.equal player.constitution, player.constitution",
            "assert.are.equal player.intelligence, player.intelligence",
            "assert.are.equal player.wisdom, player.wisdom",
            "assert.are.equal player.charisma, player.charisma",
            "assert.are.equal player.hitpoints, player.hitpoints"
          }

    table.concat [indent line, level for line in *lines], '\n'
}
