import drinksWater, ownsZebra from require 'zebra_puzzle'

describe 'zebra-puzzle', ->
  it 'resident who drinks water', ->
    assert.are.equal 'Norwegian', drinksWater!

  pending 'resident who owns zebra', ->
    assert.are.equal 'Japanese', ownsZebra!
