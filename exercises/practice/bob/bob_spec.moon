Bob = require 'bob'

describe 'bob:', ->
  it 'asking a question', ->
    result = Bob.hey "Does this cryogenic chamber make me look fat?"
    expected = 'Sure.'
    assert.are.equal expected, result

  pending 'shouting', ->
    result = Bob.hey "WATCH OUT!"
    expected = 'Whoa, chill out!'
    assert.are.equal expected, result

  pending 'forceful question', ->
    result = Bob.hey "WHAT'S GOING ON?"
    expected = "Calm down, I know what I'm doing!"
    assert.are.equal expected, result

  pending 'silence', ->
    result = Bob.hey ""
    expected = 'Fine. Be that way!'
    assert.are.equal expected, result

  pending 'stating something', ->
    result = Bob.hey "Tom-ay-to, tom-aaaah-to."
    expected = 'Whatever.'
    assert.are.equal expected, result

  pending 'asking a numeric question', ->
    result = Bob.hey "You are, what, like 15?"
    expected = 'Sure.'
    assert.are.equal expected, result

  pending 'asking gibberish', ->
    result = Bob.hey "fffbbcbeab?"
    expected = 'Sure.'
    assert.are.equal expected, result

  pending 'question with no letters', ->
    result = Bob.hey "4?"
    expected = 'Sure.'
    assert.are.equal expected, result

  pending 'non-letters with question', ->
    result = Bob.hey ":) ?"
    expected = 'Sure.'
    assert.are.equal expected, result

  pending 'prattling on', ->
    result = Bob.hey "Wait! Hang on. Are you going to be OK?"
    expected = 'Sure.'
    assert.are.equal expected, result

  pending 'ending with whitespace', ->
    result = Bob.hey "Okay if like my  spacebar  quite a bit?   "
    expected = 'Sure.'
    assert.are.equal expected, result

  pending 'multiple line question', ->
    result = Bob.hey "\nDoes this cryogenic chamber make\n me look fat?"
    expected = 'Sure.'
    assert.are.equal expected, result

  pending 'shouting gibberish', ->
    result = Bob.hey "FCECDFCAAB"
    expected = 'Whoa, chill out!'
    assert.are.equal expected, result

  pending 'shouting a statement containing a question mark', ->
    result = Bob.hey "DO LIONS EAT PEOPLE? AHHHHH."
    expected = 'Whoa, chill out!'
    assert.are.equal expected, result

  pending 'shouting numbers', ->
    result = Bob.hey "1, 2, 3 GO!"
    expected = 'Whoa, chill out!'
    assert.are.equal expected, result

  pending 'shouting with special characters', ->
    result = Bob.hey "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"
    expected = 'Whoa, chill out!'
    assert.are.equal expected, result

  pending 'shouting with no exclamation mark', ->
    result = Bob.hey "I HATE THE DENTIST"
    expected = 'Whoa, chill out!'
    assert.are.equal expected, result

  pending 'prolonged silence', ->
    result = Bob.hey "          "
    expected = 'Fine. Be that way!'
    assert.are.equal expected, result

  pending 'alternate silence', ->
    result = Bob.hey "\t\t\t\t\t\t\t\t\t\t"
    expected = 'Fine. Be that way!'
    assert.are.equal expected, result

  pending 'other whitespace', ->
    result = Bob.hey "\n\r \t"
    expected = 'Fine. Be that way!'
    assert.are.equal expected, result

  pending 'talking forcefully', ->
    result = Bob.hey "Hi there!"
    expected = 'Whatever.'
    assert.are.equal expected, result

  pending 'using acronyms in regular speech', ->
    result = Bob.hey "It's OK if you don't want to go work for NASA."
    expected = 'Whatever.'
    assert.are.equal expected, result

  pending 'no letters', ->
    result = Bob.hey "1, 2, 3"
    expected = 'Whatever.'
    assert.are.equal expected, result

  pending 'statement containing question mark', ->
    result = Bob.hey "Ending with ? means a question."
    expected = 'Whatever.'
    assert.are.equal expected, result

  pending 'starting with whitespace', ->
    result = Bob.hey "         hmmmmmmm..."
    expected = 'Whatever.'
    assert.are.equal expected, result

  pending 'non-question ending with whitespace', ->
    result = Bob.hey "This is a statement ending with whitespace      "
    expected = 'Whatever.'
    assert.are.equal expected, result

