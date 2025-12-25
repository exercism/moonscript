class Stack
  new: (@stack = {}) =>

  push: (val) => table.insert @stack, val
  pop: => table.remove @stack
  peek: => @stack[#@stack]
  size: => #@stack
  tolist: => @stack


class Forth
  new: =>
    @_stack = Stack!
    @_primatives = {
      dup:   (-> @dup!),
      drop:  (-> @drop!),
      swap:  (-> @swap!),
      over:  (-> @over!),
      ['+']: (-> @add!),
      ['-']: (-> @sub!),
      ['*']: (-> @mul!),
      ['/']: (-> @div!),
    }
    @_words = {}

  stack: => @_stack\tolist!

  evaluate: (script) =>
    program = (table.concat script, ' ')\lower!
    tokens = [token for token in program\gmatch('[^%s]+')]

    while #tokens > 0
      token = table.remove tokens, 1

      if @_words[token]
        -- prepend the user-defined word into the tokens list
        table.insert(tokens, i, v) for i, v in ipairs @_words[token]

      elseif token == ':'
        -- consume a bunch of tokens for the user word, and return the rest
        tokens = @_user_word tokens

      elseif @_primatives[token]
        @_primatives[token]!

      else
        num = tonumber token
        assert num, 'undefined operation'
        @_stack\push num

  -- user-defined words
  _user_word: (tokens) =>
    name = table.remove tokens, 1
    assert not tonumber(name), 'illegal operation'

    definition = {}
    while true
      token = table.remove tokens, 1
      break if token == ';'
      if @_words[token]
        table.insert definition, i, v for i, v in ipairs @_words[token]
      else
        table.insert definition, token

    @_words[name] = definition
    tokens

  -- Arithmetic
  add: => @_binary_op (a, b) -> a + b
  sub: => @_binary_op (a, b) -> a - b
  mul: => @_binary_op (a, b) -> a * b
  div: =>
    assert @_stack\peek! != 0,  'divide by zero'
    @_binary_op (a, b) -> a // b

  _binary_op: (f) =>
    @_need 2
    b = @_stack\pop!
    a = @_stack\pop!
    @_stack\push f(a, b)

  -- stack manipulation
  dup: =>
    @_need 1
    @_stack\push @_stack\peek!

  drop: =>
    @_need 1
    _ = @_stack\pop!

  swap: =>
    @_need 2
    b = @_stack\pop!
    a = @_stack\pop!
    @_stack\push b
    @_stack\push a

  over: =>
    @_need 2
    b = @_stack\pop!
    a = @_stack\peek!
    @_stack\push b
    @_stack\push a

  -- utils
  _need: (n) =>
    switch @_stack\size!
      when 0 then error 'empty stack'
      when 1 then error 'only one value on the stack' if n > 1
