import sublist from require 'sublist'

describe 'sublist:', ->
  it 'empty lists', ->
    listOne = {}
    listTwo = {}
    assert.are.equal 'equal', sublist listOne, listTwo

  pending 'empty list within non empty list', ->
    listOne = {}
    listTwo = {1, 2, 3}
    assert.are.equal 'sublist', sublist listOne, listTwo

  pending 'non empty list contains empty list', ->
    listOne = {1, 2, 3}
    listTwo = {}
    assert.are.equal 'superlist', sublist listOne, listTwo

  pending 'list equals itself', ->
    listOne = {1, 2, 3}
    listTwo = {1, 2, 3}
    assert.are.equal 'equal', sublist listOne, listTwo

  pending 'different lists', ->
    listOne = {1, 2, 3}
    listTwo = {2, 3, 4}
    assert.are.equal 'unequal', sublist listOne, listTwo

  pending 'false start', ->
    listOne = {1, 2, 5}
    listTwo = {0, 1, 2, 3, 1, 2, 5, 6}
    assert.are.equal 'sublist', sublist listOne, listTwo

  pending 'consecutive', ->
    listOne = {1, 1, 2}
    listTwo = {0, 1, 1, 1, 2, 1, 2}
    assert.are.equal 'sublist', sublist listOne, listTwo

  pending 'sublist at start', ->
    listOne = {0, 1, 2}
    listTwo = {0, 1, 2, 3, 4, 5}
    assert.are.equal 'sublist', sublist listOne, listTwo

  pending 'sublist in middle', ->
    listOne = {2, 3, 4}
    listTwo = {0, 1, 2, 3, 4, 5}
    assert.are.equal 'sublist', sublist listOne, listTwo

  pending 'sublist at end', ->
    listOne = {3, 4, 5}
    listTwo = {0, 1, 2, 3, 4, 5}
    assert.are.equal 'sublist', sublist listOne, listTwo

  pending 'at start of superlist', ->
    listOne = {0, 1, 2, 3, 4, 5}
    listTwo = {0, 1, 2}
    assert.are.equal 'superlist', sublist listOne, listTwo

  pending 'in middle of superlist', ->
    listOne = {0, 1, 2, 3, 4, 5}
    listTwo = {2, 3}
    assert.are.equal 'superlist', sublist listOne, listTwo

  pending 'at end of superlist', ->
    listOne = {0, 1, 2, 3, 4, 5}
    listTwo = {3, 4, 5}
    assert.are.equal 'superlist', sublist listOne, listTwo

  pending 'first list missing element from second list', ->
    listOne = {1, 3}
    listTwo = {1, 2, 3}
    assert.are.equal 'unequal', sublist listOne, listTwo

  pending 'second list missing element from first list', ->
    listOne = {1, 2, 3}
    listTwo = {1, 3}
    assert.are.equal 'unequal', sublist listOne, listTwo

  pending 'first list missing additional digits from second list', ->
    listOne = {1, 2}
    listTwo = {1, 22}
    assert.are.equal 'unequal', sublist listOne, listTwo

  pending 'order matters to a list', ->
    listOne = {1, 2, 3}
    listTwo = {3, 2, 1}
    assert.are.equal 'unequal', sublist listOne, listTwo

  pending 'same digits but different numbers', ->
    listOne = {1, 0, 1}
    listTwo = {10, 1}
    assert.are.equal 'unequal', sublist listOne, listTwo
