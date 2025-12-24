reverse = require 'reverse_string'

describe 'reverse-string', ->
  it 'an empty string', ->
    result = reverse ""
    assert.are.same "", result

  pending 'a word', ->
    result = reverse "robot"
    assert.are.same "tobor", result

  pending 'a capitalized word', ->
    result = reverse "Ramen"
    assert.are.same "nemaR", result

  pending 'a sentence with punctuation', ->
    result = reverse "I'm hungry!"
    assert.are.same "!yrgnuh m'I", result

  pending 'a palindrome', ->
    result = reverse "racecar"
    assert.are.same "racecar", result

  pending 'an even-sized word', ->
    result = reverse "drawer"
    assert.are.same "reward", result

  pending 'wide characters', ->
    result = reverse "子猫"
    assert.are.same "猫子", result
