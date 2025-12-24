{
  module_imports: {'modifier', 'ability', 'character'},

  test_helpers: [[
  -- ----------------------------------------------------------
  between = (state, arguments) ->
    assert #arguments == 3, 'expected three arguments to assert.between: value, min, max'
    { val, min, max } = arguments
    val and min <= val and val <= max

  say = require 'say'
  say\set 'assertion.between.positive', 'Expected %s to be in the range [%s, %s]'
  say\set 'assertion.between.negative', 'Expected %s not to be in the range [%s, %s]'
  assert\register 'assertion', 'between', between, 'assertion.between.positive', 'assertion.between.negative'
  -- ----------------------------------------------------------
  ]]

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
          "  assert.between score, 3, 18"
        }
      when 'character'
        if case.description == "random character is valid"
          lines = {
            "player = character!",
            "assert.between player.strength, 3, 18",
            "assert.between player.dexterity, 3, 18",
            "assert.between player.constitution, 3, 18",
            "assert.between player.intelligence, 3, 18",
            "assert.between player.wisdom, 3, 18",
            "assert.between player.charisma, 3, 18",
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
