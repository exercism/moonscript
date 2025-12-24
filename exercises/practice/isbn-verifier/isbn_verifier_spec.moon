Isbn10 = require 'isbn_verifier'

describe 'isbn-verifier', ->
  it 'valid isbn', ->
    assert.is_true Isbn10.is_valid '3-598-21508-8'

  pending 'invalid isbn check digit', ->
    assert.is_false Isbn10.is_valid '3-598-21508-9'

  pending 'valid isbn with a check digit of 10', ->
    assert.is_true Isbn10.is_valid '3-598-21507-X'

  pending 'check digit is a character other than X', ->
    assert.is_false Isbn10.is_valid '3-598-21507-A'

  pending 'invalid check digit in isbn is not treated as zero', ->
    assert.is_false Isbn10.is_valid '4-598-21507-B'

  pending 'invalid character in isbn is not treated as zero', ->
    assert.is_false Isbn10.is_valid '3-598-P1581-X'

  pending 'X is only valid as a check digit', ->
    assert.is_false Isbn10.is_valid '3-598-2X507-9'

  pending 'only one check digit is allowed', ->
    assert.is_false Isbn10.is_valid '3-598-21508-96'

  pending 'X is not substituted by the value 10', ->
    assert.is_false Isbn10.is_valid '3-598-2X507-5'

  pending 'valid isbn without separating dashes', ->
    assert.is_true Isbn10.is_valid '3598215088'

  pending 'isbn without separating dashes and X as check digit', ->
    assert.is_true Isbn10.is_valid '359821507X'

  pending 'isbn without check digit and dashes', ->
    assert.is_false Isbn10.is_valid '359821507'

  pending 'too long isbn and no dashes', ->
    assert.is_false Isbn10.is_valid '3598215078X'

  pending 'too short isbn', ->
    assert.is_false Isbn10.is_valid '00'

  pending 'isbn without check digit', ->
    assert.is_false Isbn10.is_valid '3-598-21507'

  pending 'check digit of X should not be used for 0', ->
    assert.is_false Isbn10.is_valid '3-598-21515-X'

  pending 'empty isbn', ->
    assert.is_false Isbn10.is_valid ''

  pending 'input is 9 characters', ->
    assert.is_false Isbn10.is_valid '134456729'

  pending 'invalid characters are not ignored after checking length', ->
    assert.is_false Isbn10.is_valid '3132P34035'

  pending 'invalid characters are not ignored before checking length', ->
    assert.is_false Isbn10.is_valid '3598P215088'

  pending 'input is too long but contains a valid isbn', ->
    assert.is_false Isbn10.is_valid '98245726788'
