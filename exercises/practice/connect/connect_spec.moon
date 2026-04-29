Connect = require 'connect'

describe 'connect', ->
  it 'an empty board has no winner', ->
    board = {
      '. . . . .',
      ' . . . . .',
      '  . . . . .',
      '   . . . . .',
      '    . . . . .',
    }
    assert.are.equal '', Connect.winner board

  pending 'X can win on a 1x1 board', ->
    board = {'X'}
    assert.are.equal 'X', Connect.winner board

  pending 'O can win on a 1x1 board', ->
    board = {'O'}
    assert.are.equal 'O', Connect.winner board

  pending 'only edges does not make a winner', ->
    board = {
      'O O O X',
      ' X . . X',
      '  X . . X',
      '   X O O O',
    }
    assert.are.equal '', Connect.winner board

  pending 'illegal diagonal does not make a winner', ->
    board = {
      'X O . .',
      ' O X X X',
      '  O X O .',
      '   . O X .',
      '    X X O O',
    }
    assert.are.equal '', Connect.winner board

  pending 'nobody wins crossing adjacent angles', ->
    board = {
      'X . . .',
      ' . X O .',
      '  O . X O',
      '   . O . X',
      '    . . O .',
    }
    assert.are.equal '', Connect.winner board

  pending 'X wins crossing from left to right', ->
    board = {
      '. O . .',
      ' O X X X',
      '  O X O .',
      '   X X O X',
      '    . O X .',
    }
    assert.are.equal 'X', Connect.winner board

  pending 'X wins with left-hand dead end fork', ->
    board = {
      '. . X .',
      ' X X . .',
      '  . X X X',
      '   O O O O',
    }
    assert.are.equal 'X', Connect.winner board

  pending 'X wins with right-hand dead end fork', ->
    board = {
      '. . X X',
      ' X X . .',
      '  . X X .',
      '   O O O O',
    }
    assert.are.equal 'X', Connect.winner board

  pending 'O wins crossing from top to bottom', ->
    board = {
      '. O . .',
      ' O X X X',
      '  O O O .',
      '   X X O X',
      '    . O X .',
    }
    assert.are.equal 'O', Connect.winner board

  pending 'X wins using a convoluted path', ->
    board = {
      '. X X . .',
      ' X . X . X',
      '  . X . X .',
      '   . X X . .',
      '    O O O O O',
    }
    assert.are.equal 'X', Connect.winner board

  pending 'X wins using a spiral path', ->
    board = {
      'O X X X X X X X X',
      ' O X O O O O O O O',
      '  O X O X X X X X O',
      '   O X O X O O O X O',
      '    O X O X X X O X O',
      '     O X O O O X O X O',
      '      O X X X X X O X O',
      '       O O O O O O O X O',
      '        X X X X X X X X O',
    }
    assert.are.equal 'X', Connect.winner board
