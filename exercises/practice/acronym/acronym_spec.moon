import abbreviate from require 'acronym'

describe 'acronym', ->
  it 'basic', ->
    result = abbreviate 'Portable Network Graphics'
    assert.are.equal 'PNG', result

  pending 'lowercase words', ->
    result = abbreviate 'Ruby on Rails'
    assert.are.equal 'ROR', result

  pending 'punctuation', ->
    result = abbreviate 'First In, First Out'
    assert.are.equal 'FIFO', result

  pending 'all caps word', ->
    result = abbreviate 'GNU Image Manipulation Program'
    assert.are.equal 'GIMP', result

  pending 'punctuation without whitespace', ->
    result = abbreviate 'Complementary metal-oxide semiconductor'
    assert.are.equal 'CMOS', result

  pending 'very long abbreviation', ->
    result = abbreviate 'Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me'
    assert.are.equal 'ROTFLSHTMDCOALM', result

  pending 'consecutive delimiters', ->
    result = abbreviate 'Something - I made up from thin air'
    assert.are.equal 'SIMUFTA', result

  pending 'apostrophes', ->
    result = abbreviate "Halley's Comet"
    assert.are.equal 'HC', result

  pending 'underscore emphasis', ->
    result = abbreviate 'The Road _Not_ Taken'
    assert.are.equal 'TRNT', result
