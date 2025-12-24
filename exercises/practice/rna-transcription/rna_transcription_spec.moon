to_rna = require 'rna_transcription'

describe 'rna-transcription', ->
  it 'Empty RNA sequence', ->
    result = to_rna ''
    assert.are.equal '', result

  pending 'RNA complement of cytosine is guanine', ->
    result = to_rna 'C'
    assert.are.equal 'G', result

  pending 'RNA complement of guanine is cytosine', ->
    result = to_rna 'G'
    assert.are.equal 'C', result

  pending 'RNA complement of thymine is adenine', ->
    result = to_rna 'T'
    assert.are.equal 'A', result

  pending 'RNA complement of adenine is uracil', ->
    result = to_rna 'A'
    assert.are.equal 'U', result

  pending 'RNA complement', ->
    result = to_rna 'ACGTGGTCTTAA'
    assert.are.equal 'UGCACCAGAAUU', result
