import translate from require 'pig_latin'

describe 'pig-latin:', ->
  describe 'ay is added to words that start with vowels:', ->
    it 'word beginning with a', ->
      result = translate 'apple'
      assert.are.equal 'appleay', result

    pending 'word beginning with e', ->
      result = translate 'ear'
      assert.are.equal 'earay', result

    pending 'word beginning with i', ->
      result = translate 'igloo'
      assert.are.equal 'iglooay', result

    pending 'word beginning with o', ->
      result = translate 'object'
      assert.are.equal 'objectay', result

    pending 'word beginning with u', ->
      result = translate 'under'
      assert.are.equal 'underay', result

    pending 'word beginning with a vowel and followed by a qu', ->
      result = translate 'equal'
      assert.are.equal 'equalay', result

  describe 'first letter and ay are moved to the end of words that start with consonants:', ->
    pending 'word beginning with p', ->
      result = translate 'pig'
      assert.are.equal 'igpay', result

    pending 'word beginning with k', ->
      result = translate 'koala'
      assert.are.equal 'oalakay', result

    pending 'word beginning with x', ->
      result = translate 'xenon'
      assert.are.equal 'enonxay', result

    pending 'word beginning with q without a following u', ->
      result = translate 'qat'
      assert.are.equal 'atqay', result

    pending 'word beginning with consonant and vowel containing qu', ->
      result = translate 'liquid'
      assert.are.equal 'iquidlay', result

  describe 'some letter clusters are treated like a single consonant:', ->
    pending 'word beginning with ch', ->
      result = translate 'chair'
      assert.are.equal 'airchay', result

    pending 'word beginning with qu', ->
      result = translate 'queen'
      assert.are.equal 'eenquay', result

    pending 'word beginning with qu and a preceding consonant', ->
      result = translate 'square'
      assert.are.equal 'aresquay', result

    pending 'word beginning with th', ->
      result = translate 'therapy'
      assert.are.equal 'erapythay', result

    pending 'word beginning with thr', ->
      result = translate 'thrush'
      assert.are.equal 'ushthray', result

    pending 'word beginning with sch', ->
      result = translate 'school'
      assert.are.equal 'oolschay', result

  describe 'some letter clusters are treated like a single vowel:', ->
    pending 'word beginning with yt', ->
      result = translate 'yttria'
      assert.are.equal 'yttriaay', result

    pending 'word beginning with xr', ->
      result = translate 'xray'
      assert.are.equal 'xrayay', result

  describe 'position of y in a word determines if it is a consonant or a vowel:', ->
    pending 'y is treated like a consonant at the beginning of a word', ->
      result = translate 'yellow'
      assert.are.equal 'ellowyay', result

    pending 'y is treated like a vowel at the end of a consonant cluster', ->
      result = translate 'rhythm'
      assert.are.equal 'ythmrhay', result

    pending 'y as second letter in two letter word', ->
      result = translate 'my'
      assert.are.equal 'ymay', result

  describe 'phrases are translated:', ->
    pending 'a whole phrase', ->
      result = translate 'quick fast run'
      assert.are.equal 'ickquay astfay unray', result
