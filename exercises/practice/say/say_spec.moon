Say = require './say'

describe 'say', ->
  it 'zero', ->
    result = Say.in_english 0
    expected = 'zero'
    assert.are.equal expected, result

  pending 'one', ->
    result = Say.in_english 1
    expected = 'one'
    assert.are.equal expected, result

  pending 'fourteen', ->
    result = Say.in_english 14
    expected = 'fourteen'
    assert.are.equal expected, result

  pending 'twenty', ->
    result = Say.in_english 20
    expected = 'twenty'
    assert.are.equal expected, result

  pending 'twenty-two', ->
    result = Say.in_english 22
    expected = 'twenty-two'
    assert.are.equal expected, result

  pending 'thirty', ->
    result = Say.in_english 30
    expected = 'thirty'
    assert.are.equal expected, result

  pending 'ninety-nine', ->
    result = Say.in_english 99
    expected = 'ninety-nine'
    assert.are.equal expected, result

  pending 'one hundred', ->
    result = Say.in_english 100
    expected = 'one hundred'
    assert.are.equal expected, result

  pending 'one hundred twenty-three', ->
    result = Say.in_english 123
    expected = 'one hundred twenty-three'
    assert.are.equal expected, result

  pending 'two hundred', ->
    result = Say.in_english 200
    expected = 'two hundred'
    assert.are.equal expected, result

  pending 'nine hundred ninety-nine', ->
    result = Say.in_english 999
    expected = 'nine hundred ninety-nine'
    assert.are.equal expected, result

  pending 'one thousand', ->
    result = Say.in_english 1000
    expected = 'one thousand'
    assert.are.equal expected, result

  pending 'one thousand two hundred thirty-four', ->
    result = Say.in_english 1234
    expected = 'one thousand two hundred thirty-four'
    assert.are.equal expected, result

  pending 'one million', ->
    result = Say.in_english 1000000
    expected = 'one million'
    assert.are.equal expected, result

  pending 'one million two thousand three hundred forty-five', ->
    result = Say.in_english 1002345
    expected = 'one million two thousand three hundred forty-five'
    assert.are.equal expected, result

  pending 'one billion', ->
    result = Say.in_english 1000000000
    expected = 'one billion'
    assert.are.equal expected, result

  pending 'a big number', ->
    result = Say.in_english 987654321123
    expected = 'nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three'
    assert.are.equal expected, result

  pending 'numbers below zero are out of range', ->
    f = -> Say.in_english -1
    assert.has.error f,'input out of range'

  pending 'numbers above 999,999,999,999 are out of range', ->
    f = -> Say.in_english 1000000000000
    assert.has.error f,'input out of range'
