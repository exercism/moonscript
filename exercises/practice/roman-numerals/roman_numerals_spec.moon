RomanNumerals = require 'roman_numerals'

describe 'roman-numerals:', ->
  it '1 is I', ->
    assert.are.equal 'I', RomanNumerals.to_roman 1

  pending '2 is II', ->
    assert.are.equal 'II', RomanNumerals.to_roman 2

  pending '3 is III', ->
    assert.are.equal 'III', RomanNumerals.to_roman 3

  pending '4 is IV', ->
    assert.are.equal 'IV', RomanNumerals.to_roman 4

  pending '5 is V', ->
    assert.are.equal 'V', RomanNumerals.to_roman 5

  pending '6 is VI', ->
    assert.are.equal 'VI', RomanNumerals.to_roman 6

  pending '9 is IX', ->
    assert.are.equal 'IX', RomanNumerals.to_roman 9

  pending '16 is XVI', ->
    assert.are.equal 'XVI', RomanNumerals.to_roman 16

  pending '27 is XXVII', ->
    assert.are.equal 'XXVII', RomanNumerals.to_roman 27

  pending '48 is XLVIII', ->
    assert.are.equal 'XLVIII', RomanNumerals.to_roman 48

  pending '49 is XLIX', ->
    assert.are.equal 'XLIX', RomanNumerals.to_roman 49

  pending '59 is LIX', ->
    assert.are.equal 'LIX', RomanNumerals.to_roman 59

  pending '66 is LXVI', ->
    assert.are.equal 'LXVI', RomanNumerals.to_roman 66

  pending '93 is XCIII', ->
    assert.are.equal 'XCIII', RomanNumerals.to_roman 93

  pending '141 is CXLI', ->
    assert.are.equal 'CXLI', RomanNumerals.to_roman 141

  pending '163 is CLXIII', ->
    assert.are.equal 'CLXIII', RomanNumerals.to_roman 163

  pending '166 is CLXVI', ->
    assert.are.equal 'CLXVI', RomanNumerals.to_roman 166

  pending '402 is CDII', ->
    assert.are.equal 'CDII', RomanNumerals.to_roman 402

  pending '575 is DLXXV', ->
    assert.are.equal 'DLXXV', RomanNumerals.to_roman 575

  pending '666 is DCLXVI', ->
    assert.are.equal 'DCLXVI', RomanNumerals.to_roman 666

  pending '911 is CMXI', ->
    assert.are.equal 'CMXI', RomanNumerals.to_roman 911

  pending '1024 is MXXIV', ->
    assert.are.equal 'MXXIV', RomanNumerals.to_roman 1024

  pending '1666 is MDCLXVI', ->
    assert.are.equal 'MDCLXVI', RomanNumerals.to_roman 1666

  pending '3000 is MMM', ->
    assert.are.equal 'MMM', RomanNumerals.to_roman 3000

  pending '3001 is MMMI', ->
    assert.are.equal 'MMMI', RomanNumerals.to_roman 3001

  pending '3888 is MMMDCCCLXXXVIII', ->
    assert.are.equal 'MMMDCCCLXXXVIII', RomanNumerals.to_roman 3888

  pending '3999 is MMMCMXCIX', ->
    assert.are.equal 'MMMCMXCIX', RomanNumerals.to_roman 3999
