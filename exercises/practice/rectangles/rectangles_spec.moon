import rectangles from require 'rectangles'

describe 'rectangles', ->
  it 'no rows', ->
    input = {}
    assert.are.equal 0, rectangles input

  pending 'no columns', ->
    input = {''}
    assert.are.equal 0, rectangles input

  pending 'no rectangles', ->
    input = {' '}
    assert.are.equal 0, rectangles input

  pending 'one rectangle', ->
    input = {
      '+-+',
      '| |',
      '+-+',
    }
    assert.are.equal 1, rectangles input

  pending 'two rectangles without shared parts', ->
    input = {
      '  +-+',
      '  | |',
      '+-+-+',
      '| |  ',
      '+-+  ',
    }
    assert.are.equal 2, rectangles input

  pending 'five rectangles with shared parts', ->
    input = {
      '  +-+',
      '  | |',
      '+-+-+',
      '| | |',
      '+-+-+',
    }
    assert.are.equal 5, rectangles input

  pending 'rectangle of height 1 is counted', ->
    input = {
      '+--+',
      '+--+',
    }
    assert.are.equal 1, rectangles input

  pending 'rectangle of width 1 is counted', ->
    input = {
      '++',
      '||',
      '++',
    }
    assert.are.equal 1, rectangles input

  pending '1x1 square is counted', ->
    input = {
      '++',
      '++',
    }
    assert.are.equal 1, rectangles input

  pending 'only complete rectangles are counted', ->
    input = {
      '  +-+',
      '    |',
      '+-+-+',
      '| | -',
      '+-+-+',
    }
    assert.are.equal 1, rectangles input

  pending 'rectangles can be of different sizes', ->
    input = {
      '+------+----+',
      '|      |    |',
      '+---+--+    |',
      '|   |       |',
      '+---+-------+',
    }
    assert.are.equal 3, rectangles input

  pending 'corner is required for a rectangle to be complete', ->
    input = {
      '+------+----+',
      '|      |    |',
      '+------+    |',
      '|   |       |',
      '+---+-------+',
    }
    assert.are.equal 2, rectangles input

  pending 'large input with many rectangles', ->
    input = {
      '+---+--+----+',
      '|   +--+----+',
      '+---+--+    |',
      '|   +--+----+',
      '+---+--+--+-+',
      '+---+--+--+-+',
      '+------+  | |',
      '          +-+',
    }
    assert.are.equal 60, rectangles input

  pending 'rectangles must have four sides', ->
    input = {
      '+-+ +-+',
      '| | | |',
      '+-+-+-+',
      '  | |  ',
      '+-+-+-+',
      '| | | |',
      '+-+ +-+',
    }
    assert.are.equal 5, rectangles input
