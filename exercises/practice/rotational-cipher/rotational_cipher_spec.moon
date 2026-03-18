RotationalCipher = require 'rotational_cipher'

describe 'rotational-cipher', ->
  it 'rotate a by 0, same output as input', ->
    result = RotationalCipher.rotate 'a', 0
    expected = 'a'
    assert.are.equal expected, result

  pending 'rotate a by 1', ->
    result = RotationalCipher.rotate 'a', 1
    expected = 'b'
    assert.are.equal expected, result

  pending 'rotate a by 26, same output as input', ->
    result = RotationalCipher.rotate 'a', 26
    expected = 'a'
    assert.are.equal expected, result

  pending 'rotate m by 13', ->
    result = RotationalCipher.rotate 'm', 13
    expected = 'z'
    assert.are.equal expected, result

  pending 'rotate n by 13 with wrap around alphabet', ->
    result = RotationalCipher.rotate 'n', 13
    expected = 'a'
    assert.are.equal expected, result

  pending 'rotate capital letters', ->
    result = RotationalCipher.rotate 'OMG', 5
    expected = 'TRL'
    assert.are.equal expected, result

  pending 'rotate spaces', ->
    result = RotationalCipher.rotate 'O M G', 5
    expected = 'T R L'
    assert.are.equal expected, result

  pending 'rotate numbers', ->
    result = RotationalCipher.rotate 'Testing 1 2 3 testing', 4
    expected = 'Xiwxmrk 1 2 3 xiwxmrk'
    assert.are.equal expected, result

  pending 'rotate punctuation', ->
    result = RotationalCipher.rotate "Let's eat, Grandma!", 21
    expected = "Gzo'n zvo, Bmviyhv!"
    assert.are.equal expected, result

  pending 'rotate all letters', ->
    result = RotationalCipher.rotate 'The quick brown fox jumps over the lazy dog.', 13
    expected = 'Gur dhvpx oebja sbk whzcf bire gur ynml qbt.'
    assert.are.equal expected, result
