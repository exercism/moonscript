import count_words from require 'word_count'

describe 'word-count', ->
  -- ----------------------------------------------------------
  same_kv = (state, arguments) ->
    actual = arguments[1]
    return false if type(actual) != 'table'
    expected = arguments[2]
    size = (t) -> #[k for k, _ in pairs t]
    return false if size(expected) != size(actual)
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
      of: 1,
      each: 1,
      one: 1,
    }
    assert.has.same_kv result, expected

  pending 'multiple occurrences of a word', ->
    result = count_words "one fish two fish red fish blue fish"
    expected = {
      two: 1,
      blue: 1,
      fish: 4,
      one: 1,
      red: 1,
    }
    assert.has.same_kv result, expected

  pending 'handles cramped lists', ->
    result = count_words "one,two,three"
    expected = {
      two: 1,
      one: 1,
      three: 1,
    }
    assert.has.same_kv result, expected

  pending 'handles expanded lists', ->
    result = count_words "one,\ntwo,\nthree"
    expected = {
      two: 1,
      one: 1,
      three: 1,
    }
    assert.has.same_kv result, expected

  pending 'ignore punctuation', ->
    result = count_words "car: carpet as java: javascript!!&@$%^&"
    expected = {
      java: 1,
      javascript: 1,
      car: 1,
      carpet: 1,
      as: 1,
    }
    assert.has.same_kv result, expected

  pending 'include numbers', ->
    result = count_words "testing, 1, 2 testing"
    expected = {
      '2': 1,
      testing: 2,
      '1': 1,
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
      then: 1,
      it: 1,
      getting: 1,
      "you're": 1,
      "don't": 2,
      first: 1,
      cry: 1,
      laugh: 1,
    }
    assert.has.same_kv result, expected

  pending 'with quotations', ->
    result = count_words "Joe can't tell between 'large' and large."
    expected = {
      tell: 1,
      "can't": 1,
      large: 2,
      joe: 1,
      and: 1,
      between: 1,
    }
    assert.has.same_kv result, expected

  pending 'substrings from the beginning', ->
    result = count_words "Joe can't tell between app, apple and a."
    expected = {
      tell: 1,
      "can't": 1,
      a: 1,
      app: 1,
      between: 1,
      joe: 1,
      and: 1,
      apple: 1,
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
      one: 1,
      three: 1,
    }
    assert.has.same_kv result, expected

  pending 'quotation for word with apostrophe', ->
    result = count_words "can, can't, 'can't'"
    expected = {
      can: 1,
      "can't": 2,
    }
    assert.has.same_kv result, expected
