import count_words from require 'word_count'

describe 'word-count', ->
  -- ----------------------------------------------------------
  same_kv = (state, arguments) ->
    expected = arguments[1]
    actual = arguments[2]
    return false if #expected != #actual
    for k, v in pairs expected
      return false if actual[k] != v
    true

  say = require 'say'
  say\set 'assertion.same_kv.positive', 'Expected\n%s\nto have the same keys and values as\n%s'
  say\set 'assertion.same_kv.negative', 'Expected\n%s\nto not have the same keys and values as\n%s'
  assert\register 'assertion', 'same_kv', same_kv, 'assertion.same_kv.positive', 'assertion.same_kv.negative'
  -- ----------------------------------------------------------

  it 'count one word', ->
    result = count_words "word"
    expected = {
      word: 1,
    }
    assert.has.same_kv expected, result

  pending 'count one of each word', ->
    result = count_words "one of each"
    expected = {
      each: 1,
      one: 1,
      of: 1,
    }
    assert.has.same_kv expected, result

  pending 'multiple occurrences of a word', ->
    result = count_words "one fish two fish red fish blue fish"
    expected = {
      fish: 4,
      blue: 1,
      one: 1,
      two: 1,
      red: 1,
    }
    assert.has.same_kv expected, result

  pending 'handles cramped lists', ->
    result = count_words "one,two,three"
    expected = {
      two: 1,
      one: 1,
      three: 1,
    }
    assert.has.same_kv expected, result

  pending 'handles expanded lists', ->
    result = count_words "one,\ntwo,\nthree"
    expected = {
      two: 1,
      one: 1,
      three: 1,
    }
    assert.has.same_kv expected, result

  pending 'ignore punctuation', ->
    result = count_words "car: carpet as java: javascript!!&@$%^&"
    expected = {
      car: 1,
      as: 1,
      java: 1,
      javascript: 1,
      carpet: 1,
    }
    assert.has.same_kv expected, result

  pending 'include numbers', ->
    result = count_words "testing, 1, 2 testing"
    expected = {
      testing: 2,
      '2': 1,
      '1': 1,
    }
    assert.has.same_kv expected, result

  pending 'normalize case', ->
    result = count_words "go Go GO Stop stop"
    expected = {
      go: 3,
      stop: 2,
    }
    assert.has.same_kv expected, result

  pending 'with apostrophes', ->
    result = count_words "'First: don't laugh. Then: don't cry. You're getting it.'"
    expected = {
      then: 1,
      laugh: 1,
      "don't": 2,
      it: 1,
      first: 1,
      getting: 1,
      "you're": 1,
      cry: 1,
    }
    assert.has.same_kv expected, result

  pending 'with quotations', ->
    result = count_words "Joe can't tell between 'large' and large."
    expected = {
      joe: 1,
      tell: 1,
      large: 2,
      and: 1,
      between: 1,
      "can't": 1,
    }
    assert.has.same_kv expected, result

  pending 'substrings from the beginning', ->
    result = count_words "Joe can't tell between app, apple and a."
    expected = {
      a: 1,
      and: 1,
      joe: 1,
      apple: 1,
      tell: 1,
      app: 1,
      between: 1,
      "can't": 1,
    }
    assert.has.same_kv expected, result

  pending 'multiple spaces not detected as a word', ->
    result = count_words " multiple   whitespaces"
    expected = {
      multiple: 1,
      whitespaces: 1,
    }
    assert.has.same_kv expected, result

  pending 'alternating word separators not detected as a word', ->
    result = count_words ",\n,one,\n ,two \n 'three'"
    expected = {
      two: 1,
      one: 1,
      three: 1,
    }
    assert.has.same_kv expected, result

  pending 'quotation for word with apostrophe', ->
    result = count_words "can, can't, 'can't'"
    expected = {
      "can't": 2,
      can: 1,
    }
    assert.has.same_kv expected, result
