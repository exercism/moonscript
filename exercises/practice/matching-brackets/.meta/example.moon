push     = table.insert
pop      = table.remove
is_empty = (t) -> not next t

opener   = ']':'[', '}':'{', ')':'('


{
  is_paired: (input) ->
    stack = {}

    for char in input\gmatch '.'
      switch char
        when '[', '{', '(' then push stack, char
        when ']', '}', ')' then return false if opener[char] != pop stack

    is_empty stack
}
