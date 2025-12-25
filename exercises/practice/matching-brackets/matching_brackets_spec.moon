import is_paired from require 'matching_brackets'

describe 'matching-brackets', ->
  it 'paired square brackets', ->
    assert.is_true is_paired '[]'

  pending 'empty string', ->
    assert.is_true is_paired ''

  pending 'unpaired brackets', ->
    assert.is_false is_paired '[['

  pending 'wrong ordered brackets', ->
    assert.is_false is_paired '}{'

  pending 'wrong closing bracket', ->
    assert.is_false is_paired '{]'

  pending 'paired with whitespace', ->
    assert.is_true is_paired '{ }'

  pending 'partially paired brackets', ->
    assert.is_false is_paired '{[])'

  pending 'simple nested brackets', ->
    assert.is_true is_paired '{[]}'

  pending 'several paired brackets', ->
    assert.is_true is_paired '{}[]'

  pending 'paired and nested brackets', ->
    assert.is_true is_paired '([{}({}[])])'

  pending 'unopened closing brackets', ->
    assert.is_false is_paired '{[)][]}'

  pending 'unpaired and nested brackets', ->
    assert.is_false is_paired '([{])'

  pending 'paired and wrong nested brackets', ->
    assert.is_false is_paired '[({]})'

  pending 'paired and wrong nested brackets but innermost are correct', ->
    assert.is_false is_paired '[({}])'

  pending 'paired and incomplete brackets', ->
    assert.is_false is_paired '{}['

  pending 'too many closing brackets', ->
    assert.is_false is_paired '[]]'

  pending 'early unexpected brackets', ->
    assert.is_false is_paired ')()'

  pending 'early mismatched brackets', ->
    assert.is_false is_paired '{)()'

  pending 'math expression', ->
    assert.is_true is_paired '(((185 + 223.85) * 15) - 543)/2'

  pending 'complex latex expression', ->
    assert.is_true is_paired '\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)'
