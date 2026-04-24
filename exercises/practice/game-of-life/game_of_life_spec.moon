GameOfLife = require 'game_of_life'

describe 'game-of-life', ->
  it 'empty matrix', ->
    matrix = {}
    result = GameOfLife.tick matrix
    expected = {}
    assert.are.same expected, result

  pending 'live cells with zero live neighbors die', ->
    matrix = {
      {0, 0, 0},
      {0, 1, 0},
      {0, 0, 0},
    }
    result = GameOfLife.tick matrix
    expected = {
      {0, 0, 0},
      {0, 0, 0},
      {0, 0, 0},
    }
    assert.are.same expected, result

  pending 'live cells with only one live neighbor die', ->
    matrix = {
      {0, 0, 0},
      {0, 1, 0},
      {0, 1, 0},
    }
    result = GameOfLife.tick matrix
    expected = {
      {0, 0, 0},
      {0, 0, 0},
      {0, 0, 0},
    }
    assert.are.same expected, result

  pending 'live cells with two live neighbors stay alive', ->
    matrix = {
      {1, 0, 1},
      {1, 0, 1},
      {1, 0, 1},
    }
    result = GameOfLife.tick matrix
    expected = {
      {0, 0, 0},
      {1, 0, 1},
      {0, 0, 0},
    }
    assert.are.same expected, result

  pending 'live cells with three live neighbors stay alive', ->
    matrix = {
      {0, 1, 0},
      {1, 0, 0},
      {1, 1, 0},
    }
    result = GameOfLife.tick matrix
    expected = {
      {0, 0, 0},
      {1, 0, 0},
      {1, 1, 0},
    }
    assert.are.same expected, result

  pending 'dead cells with three live neighbors become alive', ->
    matrix = {
      {1, 1, 0},
      {0, 0, 0},
      {1, 0, 0},
    }
    result = GameOfLife.tick matrix
    expected = {
      {0, 0, 0},
      {1, 1, 0},
      {0, 0, 0},
    }
    assert.are.same expected, result

  pending 'live cells with four or more neighbors die', ->
    matrix = {
      {1, 1, 1},
      {1, 1, 1},
      {1, 1, 1},
    }
    result = GameOfLife.tick matrix
    expected = {
      {1, 0, 1},
      {0, 0, 0},
      {1, 0, 1},
    }
    assert.are.same expected, result

  pending 'bigger matrix', ->
    matrix = {
      {1, 1, 0, 1, 1, 0, 0, 0},
      {1, 0, 1, 1, 0, 0, 0, 0},
      {1, 1, 1, 0, 0, 1, 1, 1},
      {0, 0, 0, 0, 0, 1, 1, 0},
      {1, 0, 0, 0, 1, 1, 0, 0},
      {1, 1, 0, 0, 0, 1, 1, 1},
      {0, 0, 1, 0, 1, 0, 0, 1},
      {1, 0, 0, 0, 0, 0, 1, 1},
    }
    result = GameOfLife.tick matrix
    expected = {
      {1, 1, 0, 1, 1, 0, 0, 0},
      {0, 0, 0, 0, 0, 1, 1, 0},
      {1, 0, 1, 1, 1, 1, 0, 1},
      {1, 0, 0, 0, 0, 0, 0, 1},
      {1, 1, 0, 0, 1, 0, 0, 1},
      {1, 1, 0, 1, 0, 0, 0, 1},
      {1, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 1, 1},
    }
    assert.are.same expected, result
