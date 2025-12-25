push     = table.insert
pop      = table.remove
is_empty = (s) -> #s == 0

opener   = { [']']: '[', ['}']: '{', [')']: '(' }


{
  is_paired: (input) ->
    stack = {}

    for char in input\gmatch '.'
      switch char
        when '[', '{', '(' then push stack, char
        when ']', '}', ')' then return false if opener[char] != pop stack

    is_empty stack
}
