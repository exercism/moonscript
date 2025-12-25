import translate from require 'pig_latin'

describe 'pig-latin', ->
  describe 'ay is added to words that start with vowels', ->
    it 'word beginning with a', ->
      assert.are.equal 'appleay', translate 'apple'

    pending 'word beginning with e', ->
      assert.are.equal 'earay', translate 'ear'

    pending 'word beginning with i', ->
      assert.are.equal 'iglooay', translate 'igloo'

    pending 'word beginning with o', ->
      assert.are.equal 'objectay', translate 'object'

    pending 'word beginning with u', ->
      assert.are.equal 'underay', translate 'under'

    pending 'word beginning with a vowel and followed by a qu', ->
      assert.are.equal 'equalay', translate 'equal'

  describe 'first letter and ay are moved to the end of words that start with consonants', ->
    pending 'word beginning with p', ->
      assert.are.equal 'igpay', translate 'pig'

    pending 'word beginning with k', ->
      assert.are.equal 'oalakay', translate 'koala'

    pending 'word beginning with x', ->
      assert.are.equal 'enonxay', translate 'xenon'

    pending 'word beginning with q without a following u', ->
      assert.are.equal 'atqay', translate 'qat'

    pending 'word beginning with consonant and vowel containing qu', ->
      assert.are.equal 'iquidlay', translate 'liquid'

  describe 'some letter clusters are treated like a single consonant', ->
    pending 'word beginning with ch', ->
      assert.are.equal 'airchay', translate 'chair'

    pending 'word beginning with qu', ->
      assert.are.equal 'eenquay', translate 'queen'

    pending 'word beginning with qu and a preceding consonant', ->
      assert.are.equal 'aresquay', translate 'square'

    pending 'word beginning with th', ->
      assert.are.equal 'erapythay', translate 'therapy'

    pending 'word beginning with thr', ->
      assert.are.equal 'ushthray', translate 'thrush'

    pending 'word beginning with sch', ->
      assert.are.equal 'oolschay', translate 'school'

  describe 'some letter clusters are treated like a single vowel', ->
    pending 'word beginning with yt', ->
      assert.are.equal 'yttriaay', translate 'yttria'

    pending 'word beginning with xr', ->
      assert.are.equal 'xrayay', translate 'xray'

  describe 'position of y in a word determines if it is a consonant or a vowel', ->
    pending 'y is treated like a consonant at the beginning of a word', ->
      assert.are.equal 'ellowyay', translate 'yellow'

    pending 'y is treated like a vowel at the end of a consonant cluster', ->
      assert.are.equal 'ythmrhay', translate 'rhythm'

    pending 'y as second letter in two letter word', ->
      assert.are.equal 'ymay', translate 'my'

  describe 'phrases are translated', ->
    pending 'a whole phrase', ->
      assert.are.equal 'ickquay astfay unray', translate 'quick fast run'
