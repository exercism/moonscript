Wordy = require 'wordy'

describe 'wordy', ->
  it 'just a number', ->
    result = Wordy.answer 'What is 5?'
    assert.are.equal 5, result

  pending 'just a zero', ->
    result = Wordy.answer 'What is 0?'
    assert.are.equal 0, result

  pending 'just a negative number', ->
    result = Wordy.answer 'What is -123?'
    assert.are.equal -123, result

  pending 'addition', ->
    result = Wordy.answer 'What is 1 plus 1?'
    assert.are.equal 2, result

  pending 'addition with a left hand zero', ->
    result = Wordy.answer 'What is 0 plus 2?'
    assert.are.equal 2, result

  pending 'addition with a right hand zero', ->
    result = Wordy.answer 'What is 3 plus 0?'
    assert.are.equal 3, result

  pending 'more addition', ->
    result = Wordy.answer 'What is 53 plus 2?'
    assert.are.equal 55, result

  pending 'addition with negative numbers', ->
    result = Wordy.answer 'What is -1 plus -10?'
    assert.are.equal -11, result

  pending 'large addition', ->
    result = Wordy.answer 'What is 123 plus 45678?'
    assert.are.equal 45801, result

  pending 'subtraction', ->
    result = Wordy.answer 'What is 4 minus -12?'
    assert.are.equal 16, result

  pending 'multiplication', ->
    result = Wordy.answer 'What is -3 multiplied by 25?'
    assert.are.equal -75, result

  pending 'division', ->
    result = Wordy.answer 'What is 33 divided by -3?'
    assert.are.equal -11, result

  pending 'multiple additions', ->
    result = Wordy.answer 'What is 1 plus 1 plus 1?'
    assert.are.equal 3, result

  pending 'addition and subtraction', ->
    result = Wordy.answer 'What is 1 plus 5 minus -2?'
    assert.are.equal 8, result

  pending 'multiple subtraction', ->
    result = Wordy.answer 'What is 20 minus 4 minus 13?'
    assert.are.equal 3, result

  pending 'subtraction then addition', ->
    result = Wordy.answer 'What is 17 minus 6 plus 3?'
    assert.are.equal 14, result

  pending 'multiple multiplication', ->
    result = Wordy.answer 'What is 2 multiplied by -2 multiplied by 3?'
    assert.are.equal -12, result

  pending 'addition and multiplication', ->
    result = Wordy.answer 'What is -3 plus 7 multiplied by -2?'
    assert.are.equal -8, result

  pending 'multiple division', ->
    result = Wordy.answer 'What is -12 divided by 2 divided by -3?'
    assert.are.equal 2, result

  pending 'unknown operation', ->
    fn = -> Wordy.answer 'What is 52 cubed?'
    assert.has.error fn, 'unknown operation'

  pending 'Non math question', ->
    fn = -> Wordy.answer 'Who is the President of the United States?'
    assert.has.error fn, 'unknown operation'

  pending 'reject problem missing an operand', ->
    fn = -> Wordy.answer 'What is 1 plus?'
    assert.has.error fn, 'syntax error'

  pending 'reject problem with no operands or operators', ->
    fn = -> Wordy.answer 'What is?'
    assert.has.error fn, 'syntax error'

  pending 'reject two operations in a row', ->
    fn = -> Wordy.answer 'What is 1 plus plus 2?'
    assert.has.error fn, 'syntax error'

  pending 'reject two numbers in a row', ->
    fn = -> Wordy.answer 'What is 1 plus 2 1?'
    assert.has.error fn, 'syntax error'

  pending 'reject postfix notation', ->
    fn = -> Wordy.answer 'What is 1 2 plus?'
    assert.has.error fn, 'syntax error'

  pending 'reject prefix notation', ->
    fn = -> Wordy.answer 'What is plus 1 2?'
    assert.has.error fn, 'syntax error'
