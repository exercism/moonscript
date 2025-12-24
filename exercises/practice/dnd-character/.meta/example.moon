import fold from require 'moon'

modifier = (score) ->
  math.floor ((score - 10) / 2)

ability = ->
  d6 = -> math.random 6
  dice = {d6!, d6!, d6!, d6!}
  sum = fold dice, (sum, n) -> sum + n
  sum - math.min(table.unpack dice)

character = ->
  char =
    strength: ability!
    dexterity: ability!
    constitution: ability!
    intelligence: ability!
    wisdom: ability!
    charisma: ability!

  char.hitpoints = 10 + modifier char.constitution
  char

{ :modifier, :ability, :character }
