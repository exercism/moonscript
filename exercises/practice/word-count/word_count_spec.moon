import count_words from require 'word_count'

describe 'word-count:', ->
  it 'count one word', ->
    result = count_words "word"
    expected = {
      word: 1,
    }
    assert.are.same result, expected

  pending 'count one of each word', ->
    result = count_words "one of each"
    expected = {
      of: 1,
      one: 1,
      each: 1,
    }
    assert.are.same result, expected

  pending 'multiple occurrences of a word', ->
    result = count_words "one fish two fish red fish blue fish"
    expected = {
      fish: 4,
      red: 1,
      one: 1,
      two: 1,
      blue: 1,
    }
    assert.are.same result, expected

  pending 'handles cramped lists', ->
    result = count_words "one,two,three"
    expected = {
      three: 1,
      one: 1,
      two: 1,
    }
    assert.are.same result, expected

  pending 'handles expanded lists', ->
    result = count_words "one,\ntwo,\nthree"
    expected = {
      three: 1,
      one: 1,
      two: 1,
    }
    assert.are.same result, expected

  pending 'ignore punctuation', ->
    result = count_words "car: carpet as java: javascript!!&@$%^&"
    expected = {
      java: 1,
      javascript: 1,
      carpet: 1,
      car: 1,
      as: 1,
    }
    assert.are.same result, expected

  pending 'include numbers', ->
    result = count_words "testing, 1, 2 testing"
    expected = {
      '1': 1,
      '2': 1,
      testing: 2,
    }
    assert.are.same result, expected

  pending 'normalize case', ->
    result = count_words "go Go GO Stop stop"
    expected = {
      stop: 2,
      go: 3,
    }
    assert.are.same result, expected

  pending 'with apostrophes', ->
    result = count_words "'First: don't laugh. Then: don't cry. You're getting it.'"
    expected = {
      first: 1,
      getting: 1,
      it: 1,
      laugh: 1,
      "don't": 2,
      then: 1,
      "you're": 1,
      cry: 1,
    }
    assert.are.same result, expected

  pending 'with quotations', ->
    result = count_words "Joe can't tell between 'large' and large."
    expected = {
      tell: 1,
      "can't": 1,
      between: 1,
      large: 2,
      and: 1,
      joe: 1,
    }
    assert.are.same result, expected

  pending 'substrings from the beginning', ->
    result = count_words "Joe can't tell between app, apple and a."
    expected = {
      tell: 1,
      "can't": 1,
      apple: 1,
      between: 1,
      a: 1,
      app: 1,
      and: 1,
      joe: 1,
    }
    assert.are.same result, expected

  pending 'multiple spaces not detected as a word', ->
    result = count_words " multiple   whitespaces"
    expected = {
      multiple: 1,
      whitespaces: 1,
    }
    assert.are.same result, expected

  pending 'alternating word separators not detected as a word', ->
    result = count_words ",\n,one,\n ,two \n 'three'"
    expected = {
      three: 1,
      one: 1,
      two: 1,
    }
    assert.are.same result, expected

  pending 'quotation for word with apostrophe', ->
    result = count_words "can, can't, 'can't'"
    expected = {
      can: 1,
      "can't": 2,
    }
    assert.are.same result, expected
