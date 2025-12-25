Forth = require 'forth'

describe 'forth', ->
  describe 'parsing and numbers', ->
    it 'numbers just get pushed onto the stack', ->
      interpreter = Forth!
      instructions = {'1 2 3 4 5'}
      interpreter\evaluate instructions
      expected = {1, 2, 3, 4, 5}
      assert.is.same expected, interpreter\stack!

    pending 'pushes negative numbers onto the stack', ->
      interpreter = Forth!
      instructions = {'-1 -2 -3 -4 -5'}
      interpreter\evaluate instructions
      expected = {-1, -2, -3, -4, -5}
      assert.is.same expected, interpreter\stack!

  describe 'addition', ->
    pending 'can add two numbers', ->
      interpreter = Forth!
      instructions = {'1 2 +'}
      interpreter\evaluate instructions
      expected = {3}
      assert.is.same expected, interpreter\stack!

    pending 'errors if there is nothing on the stack', ->
      interpreter = Forth!
      instructions = {'+'}
      f = -> interpreter\evaluate instructions
      assert.has.errors f, 'empty stack'

    pending 'errors if there is only one value on the stack', ->
      interpreter = Forth!
      instructions = {'1 +'}
      f = -> interpreter\evaluate instructions
      assert.has.errors f, 'only one value on the stack'

    pending 'more than two values on the stack', ->
      interpreter = Forth!
      instructions = {'1 2 3 +'}
      interpreter\evaluate instructions
      expected = {1, 5}
      assert.is.same expected, interpreter\stack!

  describe 'subtraction', ->
    pending 'can subtract two numbers', ->
      interpreter = Forth!
      instructions = {'3 4 -'}
      interpreter\evaluate instructions
      expected = {-1}
      assert.is.same expected, interpreter\stack!

    pending 'errors if there is nothing on the stack', ->
      interpreter = Forth!
      instructions = {'-'}
      f = -> interpreter\evaluate instructions
      assert.has.errors f, 'empty stack'

    pending 'errors if there is only one value on the stack', ->
      interpreter = Forth!
      instructions = {'1 -'}
      f = -> interpreter\evaluate instructions
      assert.has.errors f, 'only one value on the stack'

    pending 'more than two values on the stack', ->
      interpreter = Forth!
      instructions = {'1 12 3 -'}
      interpreter\evaluate instructions
      expected = {1, 9}
      assert.is.same expected, interpreter\stack!

  describe 'multiplication', ->
    pending 'can multiply two numbers', ->
      interpreter = Forth!
      instructions = {'2 4 *'}
      interpreter\evaluate instructions
      expected = {8}
      assert.is.same expected, interpreter\stack!

    pending 'errors if there is nothing on the stack', ->
      interpreter = Forth!
      instructions = {'*'}
      f = -> interpreter\evaluate instructions
      assert.has.errors f, 'empty stack'

    pending 'errors if there is only one value on the stack', ->
      interpreter = Forth!
      instructions = {'1 *'}
      f = -> interpreter\evaluate instructions
      assert.has.errors f, 'only one value on the stack'

    pending 'more than two values on the stack', ->
      interpreter = Forth!
      instructions = {'1 2 3 *'}
      interpreter\evaluate instructions
      expected = {1, 6}
      assert.is.same expected, interpreter\stack!

  describe 'division', ->
    pending 'can divide two numbers', ->
      interpreter = Forth!
      instructions = {'12 3 /'}
      interpreter\evaluate instructions
      expected = {4}
      assert.is.same expected, interpreter\stack!

    pending 'performs integer division', ->
      interpreter = Forth!
      instructions = {'8 3 /'}
      interpreter\evaluate instructions
      expected = {2}
      assert.is.same expected, interpreter\stack!

    pending 'errors if dividing by zero', ->
      interpreter = Forth!
      instructions = {'4 0 /'}
      f = -> interpreter\evaluate instructions
      assert.has.errors f, 'divide by zero'

    pending 'errors if there is nothing on the stack', ->
      interpreter = Forth!
      instructions = {'/'}
      f = -> interpreter\evaluate instructions
      assert.has.errors f, 'empty stack'

    pending 'errors if there is only one value on the stack', ->
      interpreter = Forth!
      instructions = {'1 /'}
      f = -> interpreter\evaluate instructions
      assert.has.errors f, 'only one value on the stack'

    pending 'more than two values on the stack', ->
      interpreter = Forth!
      instructions = {'1 12 3 /'}
      interpreter\evaluate instructions
      expected = {1, 4}
      assert.is.same expected, interpreter\stack!

  describe 'combined arithmetic', ->
    pending 'addition and subtraction', ->
      interpreter = Forth!
      instructions = {'1 2 + 4 -'}
      interpreter\evaluate instructions
      expected = {-1}
      assert.is.same expected, interpreter\stack!

    pending 'multiplication and division', ->
      interpreter = Forth!
      instructions = {'2 4 * 3 /'}
      interpreter\evaluate instructions
      expected = {2}
      assert.is.same expected, interpreter\stack!

    pending 'multiplication and addition', ->
      interpreter = Forth!
      instructions = {'1 3 4 * +'}
      interpreter\evaluate instructions
      expected = {13}
      assert.is.same expected, interpreter\stack!

    pending 'addition and multiplication', ->
      interpreter = Forth!
      instructions = {'1 3 4 + *'}
      interpreter\evaluate instructions
      expected = {7}
      assert.is.same expected, interpreter\stack!

  describe 'dup', ->
    pending 'copies a value on the stack', ->
      interpreter = Forth!
      instructions = {'1 dup'}
      interpreter\evaluate instructions
      expected = {1, 1}
      assert.is.same expected, interpreter\stack!

    pending 'copies the top value on the stack', ->
      interpreter = Forth!
      instructions = {'1 2 dup'}
      interpreter\evaluate instructions
      expected = {1, 2, 2}
      assert.is.same expected, interpreter\stack!

    pending 'errors if there is nothing on the stack', ->
      interpreter = Forth!
      instructions = {'dup'}
      f = -> interpreter\evaluate instructions
      assert.has.errors f, 'empty stack'

  describe 'drop', ->
    pending 'removes the top value on the stack if it is the only one', ->
      interpreter = Forth!
      instructions = {'1 drop'}
      interpreter\evaluate instructions
      expected = {}
      assert.is.same expected, interpreter\stack!

    pending 'removes the top value on the stack if it is not the only one', ->
      interpreter = Forth!
      instructions = {'1 2 drop'}
      interpreter\evaluate instructions
      expected = {1}
      assert.is.same expected, interpreter\stack!

    pending 'errors if there is nothing on the stack', ->
      interpreter = Forth!
      instructions = {'drop'}
      f = -> interpreter\evaluate instructions
      assert.has.errors f, 'empty stack'

  describe 'swap', ->
    pending 'swaps the top two values on the stack if they are the only ones', ->
      interpreter = Forth!
      instructions = {'1 2 swap'}
      interpreter\evaluate instructions
      expected = {2, 1}
      assert.is.same expected, interpreter\stack!

    pending 'swaps the top two values on the stack if they are not the only ones', ->
      interpreter = Forth!
      instructions = {'1 2 3 swap'}
      interpreter\evaluate instructions
      expected = {1, 3, 2}
      assert.is.same expected, interpreter\stack!

    pending 'errors if there is nothing on the stack', ->
      interpreter = Forth!
      instructions = {'swap'}
      f = -> interpreter\evaluate instructions
      assert.has.errors f, 'empty stack'

    pending 'errors if there is only one value on the stack', ->
      interpreter = Forth!
      instructions = {'1 swap'}
      f = -> interpreter\evaluate instructions
      assert.has.errors f, 'only one value on the stack'

  describe 'over', ->
    pending 'copies the second element if there are only two', ->
      interpreter = Forth!
      instructions = {'1 2 over'}
      interpreter\evaluate instructions
      expected = {1, 2, 1}
      assert.is.same expected, interpreter\stack!

    pending 'copies the second element if there are more than two', ->
      interpreter = Forth!
      instructions = {'1 2 3 over'}
      interpreter\evaluate instructions
      expected = {1, 2, 3, 2}
      assert.is.same expected, interpreter\stack!

    pending 'errors if there is nothing on the stack', ->
      interpreter = Forth!
      instructions = {'over'}
      f = -> interpreter\evaluate instructions
      assert.has.errors f, 'empty stack'

    pending 'errors if there is only one value on the stack', ->
      interpreter = Forth!
      instructions = {'1 over'}
      f = -> interpreter\evaluate instructions
      assert.has.errors f, 'only one value on the stack'

  describe 'user-defined words', ->
    pending 'can consist of built-in words', ->
      interpreter = Forth!
      instructions = {': dup-twice dup dup ;', '1 dup-twice'}
      interpreter\evaluate instructions
      expected = {1, 1, 1}
      assert.is.same expected, interpreter\stack!

    pending 'execute in the right order', ->
      interpreter = Forth!
      instructions = {': countup 1 2 3 ;', 'countup'}
      interpreter\evaluate instructions
      expected = {1, 2, 3}
      assert.is.same expected, interpreter\stack!

    pending 'can override other user-defined words', ->
      interpreter = Forth!
      instructions = {
        ': foo dup ;',
        ': foo dup dup ;',
        '1 foo',
      }
      interpreter\evaluate instructions
      expected = {1, 1, 1}
      assert.is.same expected, interpreter\stack!

    pending 'can override built-in words', ->
      interpreter = Forth!
      instructions = {': swap dup ;', '1 swap'}
      interpreter\evaluate instructions
      expected = {1, 1}
      assert.is.same expected, interpreter\stack!

    pending 'can override built-in operators', ->
      interpreter = Forth!
      instructions = {': + * ;', '3 4 +'}
      interpreter\evaluate instructions
      expected = {12}
      assert.is.same expected, interpreter\stack!

    pending 'can use different words with the same name', ->
      interpreter = Forth!
      instructions = {
        ': foo 5 ;',
        ': bar foo ;',
        ': foo 6 ;',
        'bar foo',
      }
      interpreter\evaluate instructions
      expected = {5, 6}
      assert.is.same expected, interpreter\stack!

    pending 'can define word that uses word with the same name', ->
      interpreter = Forth!
      instructions = {
        ': foo 10 ;',
        ': foo foo 1 + ;',
        'foo',
      }
      interpreter\evaluate instructions
      expected = {11}
      assert.is.same expected, interpreter\stack!

    pending 'cannot redefine non-negative numbers', ->
      interpreter = Forth!
      instructions = {': 1 2 ;'}
      f = -> interpreter\evaluate instructions
      assert.has.errors f, 'illegal operation'

    pending 'cannot redefine negative numbers', ->
      interpreter = Forth!
      instructions = {': -1 2 ;'}
      f = -> interpreter\evaluate instructions
      assert.has.errors f, 'illegal operation'

    pending 'errors if executing a non-existent word', ->
      interpreter = Forth!
      instructions = {'foo'}
      f = -> interpreter\evaluate instructions
      assert.has.errors f, 'undefined operation'

    pending 'only defines locally', ->
      interp1 = Forth!
      interp2 = Forth!
      interp1\evaluate {': + - ;', '1 1 +'}
      interp2\evaluate {'1 1 +'}
      assert.are.same {0}, interp1\stack!
      assert.are.same {2}, interp2\stack!

  describe 'case-insensitivity', ->
    pending 'DUP is case-insensitive', ->
      interpreter = Forth!
      instructions = {'1 DUP Dup dup'}
      interpreter\evaluate instructions
      expected = {1, 1, 1, 1}
      assert.is.same expected, interpreter\stack!

    pending 'DROP is case-insensitive', ->
      interpreter = Forth!
      instructions = {'1 2 3 4 DROP Drop drop'}
      interpreter\evaluate instructions
      expected = {1}
      assert.is.same expected, interpreter\stack!

    pending 'SWAP is case-insensitive', ->
      interpreter = Forth!
      instructions = {'1 2 SWAP 3 Swap 4 swap'}
      interpreter\evaluate instructions
      expected = {2, 3, 4, 1}
      assert.is.same expected, interpreter\stack!

    pending 'OVER is case-insensitive', ->
      interpreter = Forth!
      instructions = {'1 2 OVER Over over'}
      interpreter\evaluate instructions
      expected = {1, 2, 1, 2, 1}
      assert.is.same expected, interpreter\stack!

    pending 'user-defined words are case-insensitive', ->
      interpreter = Forth!
      instructions = {': foo dup ;', '1 FOO Foo foo'}
      interpreter\evaluate instructions
      expected = {1, 1, 1, 1}
      assert.is.same expected, interpreter\stack!

    pending 'definitions are case-insensitive', ->
      interpreter = Forth!
      instructions = {': SWAP DUP Dup dup ;', '1 swap'}
      interpreter\evaluate instructions
      expected = {1, 1, 1, 1}
      assert.is.same expected, interpreter\stack!
