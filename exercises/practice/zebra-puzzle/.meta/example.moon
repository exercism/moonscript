permute = require 'pl.permute'  -- https://luarocks.org/modules/tieske/penlight

toTheRightOf = (a, b) -> a == b + 1
nextTo       = (a, b) -> toTheRightOf(a, b) or toTheRightOf(b, a)

FIRST = 1
MIDDLE = 3

--  1. There are five houses.
--  2. The Englishman lives in the red house.
--  3. The Spaniard owns the dog.
--  4. The person in the green house drinks coffee.
--  5. The Ukrainian drinks tea.
--  6. The green house is immediately to the right of the ivory house.
--  7. The snail owner likes to go dancing.
--  8. The person in the yellow house is a painter.
--  9. The person in the middle house drinks milk.
--  10. The Norwegian lives in the first house.
--  11. The person who enjoys reading lives in the house next to the person with the fox.
--  12. The painter's house is next to the house with the horse.
--  13. The person who plays football drinks orange juice.
--  14. The Japanese person plays chess.
--  15. The Norwegian lives next to the blue house.


solve = ->
  -- solve for colours
  for p1 in permute.order_iter {1,2,3,4,5}
    {red, green, ivory, yellow, blue} = p1
    -- clue 6
    if toTheRightOf green, ivory

      -- solve for nationalities
      for p2 in permute.order_iter {1,2,3,4,5}
        {english, spanish, ukrainian, norwegian, japanese} = p2
        -- clues 2, 10, 15
        if english == red and norwegian == FIRST and nextTo norwegian, blue
          nationalities = {
            [english]: 'EnglishMan'
            [spanish]: 'Spaniard'
            [ukrainian]: 'Ukrainian'
            [norwegian]: 'Norwegian'
            [japanese]: 'Japanese'
          }

          -- solve for beverages
          for p3 in permute.order_iter {1,2,3,4,5}
            {coffee, tea, milk, orangeJuice, water} = p3
            -- clues 4, 5, 9
            if coffee == green and ukrainian == tea and milk == MIDDLE

              -- solve for hobbies
              for p4 in permute.order_iter {1,2,3,4,5}
                {dancing, painting, reading, football, chess} = p4
                -- clues 8, 13, 14
                if painting == yellow and football == orangeJuice and japanese == chess

                  -- solve for pets
                  for p5 in permute.order_iter {1,2,3,4,5}
                    {dog, snails, fox, horse, zebra} = p5
                    -- clues 3, 7, 11, 12
                    if spanish == dog and dancing == snails and nextTo(reading, fox) and nextTo painting, horse
                      return {
                        waterDrinker: nationalities[water]
                        zebraOwner: nationalities[zebra]
                      }
  return waterDrinker: '?', zebraOwner: '?'

SOLUTION = solve!

{
  drinksWater: -> SOLUTION.waterDrinker
  ownsZebra: -> SOLUTION.zebraOwner
}
