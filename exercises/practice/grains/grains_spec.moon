Grains = require 'grains'

describe 'grains', ->
  describe 'returns the number of grains on the square', ->
    it 'grains on square 1', ->
      assert.are.equal #{format case.expected}, Grains.#{case.property} #{case.input.square}

    pending 'grains on square 2', ->
      assert.are.equal #{format case.expected}, Grains.#{case.property} #{case.input.square}

    pending 'grains on square 3', ->
      assert.are.equal #{format case.expected}, Grains.#{case.property} #{case.input.square}

    pending 'grains on square 4', ->
      assert.are.equal #{format case.expected}, Grains.#{case.property} #{case.input.square}

    pending 'grains on square 16', ->
      assert.are.equal #{format case.expected}, Grains.#{case.property} #{case.input.square}

    pending 'grains on square 32', ->
      assert.are.equal #{format case.expected}, Grains.#{case.property} #{case.input.square}

    pending 'grains on square 64', ->
      assert.are.equal #{format case.expected}, Grains.#{case.property} #{case.input.square}

    pending 'square 0 is invalid', ->
      assert.has.errors -> Grains.#{case.property} #{case.input.square}, #{quote case.expected.error}

    pending 'negative square is invalid', ->
      assert.has.errors -> Grains.#{case.property} #{case.input.square}, #{quote case.expected.error}

    pending 'square greater than 64 is invalid', ->
      assert.has.errors -> Grains.#{case.property} #{case.input.square}, #{quote case.expected.error}

  pending 'returns the total number of grains on the board', ->
    assert.are.equal #{format case.expected}, Grains.#{case.property}!
