Yacht = require 'yacht'

describe 'yacht', ->
  it 'Yacht', ->
    result = Yacht.score 'yacht', {5, 5, 5, 5, 5}
    assert.is.equal 50, result

  pending 'Not Yacht', ->
    result = Yacht.score 'yacht', {1, 3, 3, 2, 5}
    assert.is.equal 0, result

  pending 'Ones', ->
    result = Yacht.score 'ones', {1, 1, 1, 3, 5}
    assert.is.equal 3, result

  pending 'Ones, out of order', ->
    result = Yacht.score 'ones', {3, 1, 1, 5, 1}
    assert.is.equal 3, result

  pending 'No ones', ->
    result = Yacht.score 'ones', {4, 3, 6, 5, 5}
    assert.is.equal 0, result

  pending 'Twos', ->
    result = Yacht.score 'twos', {2, 3, 4, 5, 6}
    assert.is.equal 2, result

  pending 'Fours', ->
    result = Yacht.score 'fours', {1, 4, 1, 4, 1}
    assert.is.equal 8, result

  pending 'Yacht counted as threes', ->
    result = Yacht.score 'threes', {3, 3, 3, 3, 3}
    assert.is.equal 15, result

  pending 'Yacht of 3s counted as fives', ->
    result = Yacht.score 'fives', {3, 3, 3, 3, 3}
    assert.is.equal 0, result

  pending 'Fives', ->
    result = Yacht.score 'fives', {1, 5, 3, 5, 3}
    assert.is.equal 10, result

  pending 'Sixes', ->
    result = Yacht.score 'sixes', {2, 3, 4, 5, 6}
    assert.is.equal 6, result

  pending 'Full house two small, three big', ->
    result = Yacht.score 'full house', {2, 2, 4, 4, 4}
    assert.is.equal 16, result

  pending 'Full house three small, two big', ->
    result = Yacht.score 'full house', {5, 3, 3, 5, 3}
    assert.is.equal 19, result

  pending 'Two pair is not a full house', ->
    result = Yacht.score 'full house', {2, 2, 4, 4, 5}
    assert.is.equal 0, result

  pending 'Four of a kind is not a full house', ->
    result = Yacht.score 'full house', {1, 4, 4, 4, 4}
    assert.is.equal 0, result

  pending 'Yacht is not a full house', ->
    result = Yacht.score 'full house', {2, 2, 2, 2, 2}
    assert.is.equal 0, result

  pending 'Four of a Kind', ->
    result = Yacht.score 'four of a kind', {6, 6, 4, 6, 6}
    assert.is.equal 24, result

  pending 'Yacht can be scored as Four of a Kind', ->
    result = Yacht.score 'four of a kind', {3, 3, 3, 3, 3}
    assert.is.equal 12, result

  pending 'Full house is not Four of a Kind', ->
    result = Yacht.score 'four of a kind', {3, 3, 3, 5, 5}
    assert.is.equal 0, result

  pending 'Little Straight', ->
    result = Yacht.score 'little straight', {3, 5, 4, 1, 2}
    assert.is.equal 30, result

  pending 'Little Straight as Big Straight', ->
    result = Yacht.score 'big straight', {1, 2, 3, 4, 5}
    assert.is.equal 0, result

  pending 'Four in order but not a little straight', ->
    result = Yacht.score 'little straight', {1, 1, 2, 3, 4}
    assert.is.equal 0, result

  pending 'No pairs but not a little straight', ->
    result = Yacht.score 'little straight', {1, 2, 3, 4, 6}
    assert.is.equal 0, result

  pending 'Minimum is 1, maximum is 5, but not a little straight', ->
    result = Yacht.score 'little straight', {1, 1, 3, 4, 5}
    assert.is.equal 0, result

  pending 'Big Straight', ->
    result = Yacht.score 'big straight', {4, 6, 2, 5, 3}
    assert.is.equal 30, result

  pending 'Big Straight as little straight', ->
    result = Yacht.score 'little straight', {6, 5, 4, 3, 2}
    assert.is.equal 0, result

  pending 'No pairs but not a big straight', ->
    result = Yacht.score 'big straight', {6, 5, 4, 3, 1}
    assert.is.equal 0, result

  pending 'Choice', ->
    result = Yacht.score 'choice', {3, 3, 5, 6, 6}
    assert.is.equal 23, result

  pending 'Yacht as choice', ->
    result = Yacht.score 'choice', {2, 2, 2, 2, 2}
    assert.is.equal 10, result
