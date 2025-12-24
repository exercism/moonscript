hamming = require 'hamming'

describe 'hamming', ->
  it 'empty strands', ->
    result = hamming.distance '', ''
    assert.are.equal 0, result

  pending 'single letter identical strands', ->
    result = hamming.distance 'A', 'A'
    assert.are.equal 0, result

  pending 'single letter different strands', ->
    result = hamming.distance 'G', 'T'
    assert.are.equal 1, result

  pending 'long identical strands', ->
    result = hamming.distance 'GGACTGAAATCTG', 'GGACTGAAATCTG'
    assert.are.equal 0, result

  pending 'long different strands', ->
    result = hamming.distance 'GGACGGATTCTG', 'AGGACGGATTCT'
    assert.are.equal 9, result

  pending 'disallow first strand longer', ->
    f = -> hamming.distance 'AATG', 'AAA'
    assert.has.error f, 'strands must be of equal length'

  pending 'disallow second strand longer', ->
    f = -> hamming.distance 'ATA', 'AGTG'
    assert.has.error f, 'strands must be of equal length'

  pending 'disallow empty first strand', ->
    f = -> hamming.distance '', 'G'
    assert.has.error f, 'strands must be of equal length'

  pending 'disallow empty second strand', ->
    f = -> hamming.distance 'G', ''
    assert.has.error f, 'strands must be of equal length'
