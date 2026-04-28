import canChain from require 'dominoes'

describe 'dominoes', ->
  it 'empty input = empty output', ->
    dominoes = {}
    assert.is.true canChain dominoes

  pending 'singleton input = singleton output', ->
    dominoes = {{1, 1}}
    assert.is.true canChain dominoes

  pending "singleton that can't be chained", ->
    dominoes = {{1, 2}}
    assert.is.false canChain dominoes

  pending 'three elements', ->
    dominoes = {
      {1, 2},
      {3, 1},
      {2, 3},
    }
    assert.is.true canChain dominoes

  pending 'can reverse dominoes', ->
    dominoes = {
      {1, 2},
      {1, 3},
      {2, 3},
    }
    assert.is.true canChain dominoes

  pending "can't be chained", ->
    dominoes = {
      {1, 2},
      {4, 1},
      {2, 3},
    }
    assert.is.false canChain dominoes

  pending 'disconnected - simple', ->
    dominoes = {
      {1, 1},
      {2, 2},
    }
    assert.is.false canChain dominoes

  pending 'disconnected - double loop', ->
    dominoes = {
      {1, 2},
      {2, 1},
      {3, 4},
      {4, 3},
    }
    assert.is.false canChain dominoes

  pending 'disconnected - single isolated', ->
    dominoes = {
      {1, 2},
      {2, 3},
      {3, 1},
      {4, 4},
    }
    assert.is.false canChain dominoes

  pending 'need backtrack', ->
    dominoes = {
      {1, 2},
      {2, 3},
      {3, 1},
      {2, 4},
      {2, 4},
    }
    assert.is.true canChain dominoes

  pending 'separate loops', ->
    dominoes = {
      {1, 2},
      {2, 3},
      {3, 1},
      {1, 1},
      {2, 2},
      {3, 3},
    }
    assert.is.true canChain dominoes

  pending 'nine elements', ->
    dominoes = {
      {1, 2},
      {5, 3},
      {3, 1},
      {1, 2},
      {2, 4},
      {1, 6},
      {2, 3},
      {3, 4},
      {5, 6},
    }
    assert.is.true canChain dominoes

  pending 'separate three-domino loops', ->
    dominoes = {
      {1, 2},
      {2, 3},
      {3, 1},
      {4, 5},
      {5, 6},
      {6, 4},
    }
    assert.is.false canChain dominoes
