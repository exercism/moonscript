import fold from require 'moon'

local *

score = (category, dice) ->
  switch category
    when 'ones'            then single 1, dice
    when 'twos'            then single 2, dice
    when 'threes'          then single 3, dice
    when 'fours'           then single 4, dice
    when 'fives'           then single 5, dice
    when 'sixes'           then single 6, dice
    when 'full house'      then full_house dice
    when 'four of a kind'  then four_of_a_kind dice
    when 'little straight' then straight dice, {1, 2, 3, 4, 5}
    when 'big straight'    then straight dice, {2, 3, 4, 5, 6}
    when 'yacht'           then yacht dice
    when 'choice'          then sum dice


single = (target, dice) ->
  reduce 0, dice, (acc, die) -> acc + if die == target then die else 0


full_house = (dice) ->
  s = sorted dice
  -- yacht is not a full house
  return 0 if s[1] == s[5]

  if (s[1] == s[2] and s[3] == s[5]) or (s[1] == s[3] and s[4] == s[5])
    sum dice
  else
    0


four_of_a_kind = (dice) ->
  s = sorted dice
  if s[1] == s[4] or s[2] == s[5]
    4 * s[3]
  else
    0


straight = (dice, target) ->
  for i, die in ipairs sorted dice
    return 0 if die != target[i]
  30


yacht = (dice) ->
  s = sorted dice
  if s[1] == s[5] then 50 else 0


sum = (dice) ->
  fold dice, (sum, die) -> sum + die


sorted = (dice) ->
  clone = {table.unpack dice}
  table.sort clone
  clone


reduce = (init, list, f) ->
  fold {init, table.unpack list}, f


{ :score }
