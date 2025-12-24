count_eggs = require 'eliuds_eggs'

describe 'eliuds-eggs', ->
  it '0 eggs', ->
    result = count_eggs 0
    assert.are.equal 0, result

  pending '1 egg', ->
    result = count_eggs 16
    assert.are.equal 1, result

  pending '4 eggs', ->
    result = count_eggs 89
    assert.are.equal 4, result

  pending '13 eggs', ->
    result = count_eggs 2000000000
    assert.are.equal 13, result
