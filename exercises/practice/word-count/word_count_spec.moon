import count_words from require 'word_count'

describe 'word-count', ->
  -- ----------------------------------------------------------
  same_kv = (state, arguments) ->
    actual = arguments[1]
    expected = arguments[2]
    return false if #expected != #actual
    for k, v in pairs expected
      return false if actual[k] != v
    true

  say = require 'say'
  say\set 'assertion.same_kv.positive', 'Actual result\n%s\ndoes not have the same keys and values as expected\n%s'
  say\set 'assertion.same_kv.negative', 'Actual result\n%s\nwas not supposed to be the same as expected\n%s'
  assert\register 'assertion', 'same_kv', same_kv, 'assertion.same_kv.positive', 'assertion.same_kv.negative'
  -- ----------------------------------------------------------

  it 'count one word', ->
    result = count_words "word"
    expected = {
      word: 1,
    }
    assert.has.same_kv result, expected

  pending 'count one of each word', ->
    result = count_words "one of each"
    expected = {
      each: 1,
      of: 1,
      one: 1,
    }
    assert.has.same_kv result, expected

  pending 'multiple occurrences of a word', ->
    result = count_words "one fish two fish red fish blue fish"
    expected = {
      fish: 4,
      one: 1,
      red: 1,
      blue: 1,
      two: 1,
    }
    assert.has.same_kv result, expected

  pending 'handles cramped lists', ->
    result = count_words "one,two,three"
    expected = {
      two: 1,
      three: 1,
      one: 1,
    }
    assert.has.same_kv result, expected

  pending 'handles expanded lists', ->
    result = count_words "one,\ntwo,\nthree"
    expected = {
      two: 1,
      three: 1,
      one: 1,
    }
    assert.has.same_kv result, expected

  pending 'ignore punctuation', ->
    result = count_words "car: carpet as java: javascript!!&@$%^&"
    expected = {
      carpet: 1,
      javascript: 1,
      as: 1,
      java: 1,
      car: 1,
    }
    assert.has.same_kv result, expected

  pending 'include numbers', ->
    result = count_words "testing, 1, 2 testing"
    expected = {
      '1': 1,
      testing: 2,
      '2': 1,
    }
    assert.has.same_kv result, expected

  pending 'normalize case', ->
    result = count_words "go Go GO Stop stop"
    expected = {
      go: 3,
      stop: 2,
    }
    assert.has.same_kv result, expected

  pending 'with apostrophes', ->
    result = count_words "'First: don't laugh. Then: don't cry. You're getting it.'"
    expected = {
      first: 1,
      it: 1,
      laugh: 1,
      "you're": 1,
      cry: 1,
      then: 1,
      getting: 1,
      "don't": 2,
    }
    assert.has.same_kv result, expected

  pending 'with quotations', ->
    result = count_words "Joe can't tell between 'large' and large."
    expected = {
      tell: 1,
      and: 1,
      large: 2,
      "can't": 1,
      between: 1,
      joe: 1,
    }
    assert.has.same_kv result, expected

  pending 'substrings from the beginning', ->
    result = count_words "Joe can't tell between app, apple and a."
    expected = {
      app: 1,
      a: 1,
      tell: 1,
      apple: 1,
      and: 1,
      "can't": 1,
      between: 1,
      joe: 1,
    }
    assert.has.same_kv result, expected

  pending 'multiple spaces not detected as a word', ->
    result = count_words " multiple   whitespaces"
    expected = {
      whitespaces: 1,
      multiple: 1,
    }
    assert.has.same_kv result, expected

  pending 'alternating word separators not detected as a word', ->
    result = count_words ",\n,one,\n ,two \n 'three'"
    expected = {
      two: 1,
      three: 1,
      one: 1,
    }
    assert.has.same_kv result, expected

  pending 'quotation for word with apostrophe', ->
    result = count_words "can, can't, 'can't'"
    expected = {
      "can't": 2,
      can: 1,
    }
    assert.has.same_kv result, expected
