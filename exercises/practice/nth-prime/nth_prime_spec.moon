import prime from require 'nth_prime'

describe 'nth-prime', ->
  it 'first prime', ->
    assert.are.equal 2, prime 1

  pending 'second prime', ->
    assert.are.equal 3, prime 2

  pending 'sixth prime', ->
    assert.are.equal 13, prime 6

  pending 'big prime', ->
    assert.are.equal 104743, prime 10001

  pending 'there is no zeroth prime', ->
    assert.has.errors (-> prime 0), 'there is no zeroth prime'
