Strain = require 'strain'

describe 'strain', ->
  local starts_with, contains

  starts_with = (str, prefix) ->
    str\sub(1, #prefix) == prefix

  contains = (list, element) ->
    for item in *list
      if item == element
        return true
    false

  it 'keep on empty list returns empty list', ->
    result = Strain.keep {}, (x) -> true
    expected = {}
    assert.are.same expected, result

  pending 'keeps everything', ->
    result = Strain.keep {1, 3, 5}, (x) -> true
    expected = {1, 3, 5}
    assert.are.same expected, result

  pending 'keeps nothing', ->
    result = Strain.keep {1, 3, 5}, (x) -> false
    expected = {}
    assert.are.same expected, result

  pending 'keeps first and last', ->
    result = Strain.keep {1, 2, 3}, (x) -> x % 2 == 1
    expected = {1, 3}
    assert.are.same expected, result

  pending 'keeps neither first nor last', ->
    result = Strain.keep {1, 2, 3}, (x) -> x % 2 == 0
    expected = {2}
    assert.are.same expected, result

  pending 'keeps strings', ->
    result = Strain.keep {'apple', 'zebra', 'banana', 'zombies', 'cherimoya', 'zealot'}, (x) -> starts_with x, 'z'
    expected = {'zebra', 'zombies', 'zealot'}
    assert.are.same expected, result

  pending 'keeps lists', ->
    result = Strain.keep {
      {1, 2, 3}
      {5, 5, 5}
      {5, 1, 2}
      {2, 1, 2}
      {1, 5, 2}
      {2, 2, 1}
      {1, 2, 5}
    }, (x) -> contains x, 5
    expected = {
      {5, 5, 5}
      {5, 1, 2}
      {1, 5, 2}
      {1, 2, 5}
    }
    assert.are.same expected, result

  pending 'discard on empty list returns empty list', ->
    result = Strain.discard {}, (x) -> true
    expected = {}
    assert.are.same expected, result

  pending 'discards everything', ->
    result = Strain.discard {1, 3, 5}, (x) -> true
    expected = {}
    assert.are.same expected, result

  pending 'discards nothing', ->
    result = Strain.discard {1, 3, 5}, (x) -> false
    expected = {1, 3, 5}
    assert.are.same expected, result

  pending 'discards first and last', ->
    result = Strain.discard {1, 2, 3}, (x) -> x % 2 == 1
    expected = {2}
    assert.are.same expected, result

  pending 'discards neither first nor last', ->
    result = Strain.discard {1, 2, 3}, (x) -> x % 2 == 0
    expected = {1, 3}
    assert.are.same expected, result

  pending 'discards strings', ->
    result = Strain.discard {'apple', 'zebra', 'banana', 'zombies', 'cherimoya', 'zealot'}, (x) -> starts_with x, 'z'
    expected = {'apple', 'banana', 'cherimoya'}
    assert.are.same expected, result

  pending 'discards lists', ->
    result = Strain.discard {
      {1, 2, 3}
      {5, 5, 5}
      {5, 1, 2}
      {2, 1, 2}
      {1, 5, 2}
      {2, 2, 1}
      {1, 2, 5}
    }, (x) -> contains x, 5
    expected = {
      {1, 2, 3}
      {2, 1, 2}
      {2, 2, 1}
    }
    assert.are.same expected, result
