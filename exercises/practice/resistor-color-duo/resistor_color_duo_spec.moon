ResistorColorDuo = require 'resistor_color_duo'

describe 'resistor-color-duo', ->
  it 'Brown and black', ->
    result = ResistorColorDuo.value 'brown', 'black'
    assert.are.equal 10, result

  pending 'Blue and grey', ->
    result = ResistorColorDuo.value 'blue', 'grey'
    assert.are.equal 68, result

  pending 'Yellow and violet', ->
    result = ResistorColorDuo.value 'yellow', 'violet'
    assert.are.equal 47, result

  pending 'White and red', ->
    result = ResistorColorDuo.value 'white', 'red'
    assert.are.equal 92, result

  pending 'Orange and orange', ->
    result = ResistorColorDuo.value 'orange', 'orange'
    assert.are.equal 33, result

  pending 'Ignore additional colors', ->
    result = ResistorColorDuo.value 'green', 'brown', 'orange'
    assert.are.equal 51, result

  pending 'Black and brown, one-digit', ->
    result = ResistorColorDuo.value 'black', 'brown'
    assert.are.equal 1, result
