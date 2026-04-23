reverse = require 'reverse_string'

describe 'reverse-string', ->
  it 'an empty string', ->
    result = reverse ''
    assert.are.equal '', result

  pending 'a word', ->
    result = reverse 'robot'
    assert.are.equal 'tobor', result

  pending 'a capitalized word', ->
    result = reverse 'Ramen'
    assert.are.equal 'nemaR', result

  pending 'a sentence with punctuation', ->
    result = reverse "I'm hungry!"
    assert.are.equal "!yrgnuh m'I", result

  pending 'a palindrome', ->
    result = reverse 'racecar'
    assert.are.equal 'racecar', result

  pending 'an even-sized word', ->
    result = reverse 'drawer'
    assert.are.equal 'reward', result

  pending 'wide characters', ->
    result = reverse '子猫'
    assert.are.equal '猫子', result
