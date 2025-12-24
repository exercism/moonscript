Luhn = require 'luhn'

describe 'luhn', ->
  it 'single digit strings can not be valid', ->
    assert.is_false Luhn.is_valid '1'

  pending 'a single zero is invalid', ->
    assert.is_false Luhn.is_valid '0'

  pending 'a simple valid SIN that remains valid if reversed', ->
    assert.is_true Luhn.is_valid '059'

  pending 'a simple valid SIN that becomes invalid if reversed', ->
    assert.is_true Luhn.is_valid '59'

  pending 'a valid Canadian SIN', ->
    assert.is_true Luhn.is_valid '055 444 285'

  pending 'invalid Canadian SIN', ->
    assert.is_false Luhn.is_valid '055 444 286'

  pending 'invalid credit card', ->
    assert.is_false Luhn.is_valid '8273 1232 7352 0569'

  pending 'invalid long number with an even remainder', ->
    assert.is_false Luhn.is_valid '1 2345 6789 1234 5678 9012'

  pending 'invalid long number with a remainder divisible by 5', ->
    assert.is_false Luhn.is_valid '1 2345 6789 1234 5678 9013'

  pending 'valid number with an even number of digits', ->
    assert.is_true Luhn.is_valid '095 245 88'

  pending 'valid number with an odd number of spaces', ->
    assert.is_true Luhn.is_valid '234 567 891 234'

  pending 'valid strings with a non-digit added at the end become invalid', ->
    assert.is_false Luhn.is_valid '059a'

  pending 'valid strings with punctuation included become invalid', ->
    assert.is_false Luhn.is_valid '055-444-285'

  pending 'valid strings with symbols included become invalid', ->
    assert.is_false Luhn.is_valid '055# 444$ 285'

  pending 'single zero with space is invalid', ->
    assert.is_false Luhn.is_valid ' 0'

  pending 'more than a single zero is valid', ->
    assert.is_true Luhn.is_valid '0000 0'

  pending 'input digit 9 is correctly converted to output digit 9', ->
    assert.is_true Luhn.is_valid '091'

  pending 'very long input is valid', ->
    assert.is_true Luhn.is_valid '9999999999 9999999999 9999999999 9999999999'

  pending 'valid luhn with an odd number of digits and non zero first digit', ->
    assert.is_true Luhn.is_valid '109'

  pending "using ascii value for non-doubled non-digit isn't allowed", ->
    assert.is_false Luhn.is_valid '055b 444 285'

  pending "using ascii value for doubled non-digit isn't allowed", ->
    assert.is_false Luhn.is_valid ':9'

  pending "non-numeric, non-space char in the middle with a sum that's divisible by 10 isn't allowed", ->
    assert.is_false Luhn.is_valid '59%59'
