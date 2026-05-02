import solve from require 'alphametics'

describe 'alphametics:', ->
  -- ----------------------------------------------------------
  same_kv = (state, arguments) ->
    actual = arguments[1]
    return false if type(actual) != 'table'
    expected = arguments[2]
    size = (t) -> #[k for k, _ in pairs t]
    return false if size(expected) != size(actual)
    for k, v in pairs expected
      return false if actual[k] != v
    true

  say = require 'say'
  say\set 'assertion.same_kv.positive', 'Actual result\n%s\ndoes not have the same keys and values as expected\n%s'
  say\set 'assertion.same_kv.negative', 'Actual result\n%s\nwas not supposed to be the same as expected\n%s'
  assert\register 'assertion', 'same_kv', same_kv, 'assertion.same_kv.positive', 'assertion.same_kv.negative'
  -- ----------------------------------------------------------

  it 'puzzle with three letters', ->
    puzzle = 'I + BB == ILL'
    result = solve puzzle
    expected = {
      I: 1,
      B: 9,
      L: 0,
    }
    assert.is.same_kv result, expected

  pending 'solution must have unique value for each letter', ->
    puzzle = 'A == B'
    assert.is.falsy solve puzzle

  pending 'leading zero solution is invalid', ->
    puzzle = 'ACA + DD == BD'
    assert.is.falsy solve puzzle

  pending 'puzzle with two digits final carry', ->
    puzzle = 'A + A + A + A + A + A + A + A + A + A + A + B == BCC'
    result = solve puzzle
    expected = {
      A: 9,
      B: 1,
      C: 0,
    }
    assert.is.same_kv result, expected

  pending 'puzzle with four letters', ->
    puzzle = 'AS + A == MOM'
    result = solve puzzle
    expected = {
      A: 9,
      O: 0,
      S: 2,
      M: 1,
    }
    assert.is.same_kv result, expected

  pending 'puzzle with six letters', ->
    puzzle = 'NO + NO + TOO == LATE'
    result = solve puzzle
    expected = {
      E: 2,
      N: 7,
      O: 4,
      A: 0,
      T: 9,
      L: 1,
    }
    assert.is.same_kv result, expected

  pending 'puzzle with seven letters', ->
    puzzle = 'HE + SEES + THE == LIGHT'
    result = solve puzzle
    expected = {
      E: 4,
      G: 2,
      H: 5,
      I: 0,
      T: 7,
      S: 9,
      L: 1,
    }
    assert.is.same_kv result, expected

  pending 'puzzle with eight letters', ->
    puzzle = 'SEND + MORE == MONEY'
    result = solve puzzle
    expected = {
      E: 5,
      N: 6,
      O: 0,
      M: 1,
      Y: 2,
      R: 8,
      S: 9,
      D: 7,
    }
    assert.is.same_kv result, expected

  pending 'puzzle with ten letters', ->
    puzzle = 'AND + A + STRONG + OFFENSE + AS + A + GOOD == DEFENSE'
    result = solve puzzle
    expected = {
      N: 0,
      O: 2,
      E: 4,
      F: 7,
      G: 8,
      T: 9,
      A: 5,
      R: 1,
      S: 6,
      D: 3,
    }
    assert.is.same_kv result, expected

  pending 'puzzle with ten letters and 199 addends', ->
    puzzle = 'THIS + A + FIRE + THEREFORE + FOR + ALL + HISTORIES + I + TELL + A + TALE + THAT + FALSIFIES + ITS + TITLE + TIS + A + LIE + THE + TALE + OF + THE + LAST + FIRE + HORSES + LATE + AFTER + THE + FIRST + FATHERS + FORESEE + THE + HORRORS + THE + LAST + FREE + TROLL + TERRIFIES + THE + HORSES + OF + FIRE + THE + TROLL + RESTS + AT + THE + HOLE + OF + LOSSES + IT + IS + THERE + THAT + SHE + STORES + ROLES + OF + LEATHERS + AFTER + SHE + SATISFIES + HER + HATE + OFF + THOSE + FEARS + A + TASTE + RISES + AS + SHE + HEARS + THE + LEAST + FAR + HORSE + THOSE + FAST + HORSES + THAT + FIRST + HEAR + THE + TROLL + FLEE + OFF + TO + THE + FOREST + THE + HORSES + THAT + ALERTS + RAISE + THE + STARES + OF + THE + OTHERS + AS + THE + TROLL + ASSAILS + AT + THE + TOTAL + SHIFT + HER + TEETH + TEAR + HOOF + OFF + TORSO + AS + THE + LAST + HORSE + FORFEITS + ITS + LIFE + THE + FIRST + FATHERS + HEAR + OF + THE + HORRORS + THEIR + FEARS + THAT + THE + FIRES + FOR + THEIR + FEASTS + ARREST + AS + THE + FIRST + FATHERS + RESETTLE + THE + LAST + OF + THE + FIRE + HORSES + THE + LAST + TROLL + HARASSES + THE + FOREST + HEART + FREE + AT + LAST + OF + THE + LAST + TROLL + ALL + OFFER + THEIR + FIRE + HEAT + TO + THE + ASSISTERS + FAR + OFF + THE + TROLL + FASTS + ITS + LIFE + SHORTER + AS + STARS + RISE + THE + HORSES + REST + SAFE + AFTER + ALL + SHARE + HOT + FISH + AS + THEIR + AFFILIATES + TAILOR + A + ROOFS + FOR + THEIR + SAFE == FORTRESSES'
    result = solve puzzle
    expected = {
      O: 6,
      I: 7,
      L: 2,
      E: 0,
      F: 5,
      H: 8,
      A: 1,
      R: 3,
      S: 4,
      T: 9,
    }
    assert.is.same_kv result, expected
