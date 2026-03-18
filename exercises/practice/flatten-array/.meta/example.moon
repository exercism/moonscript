{
  flatten: (input) ->
    result = {}

    -- a recursive closure
    _flatten = (list) ->
      for elem in *list
        if type(elem) == 'table'
          _flatten elem
        elseif elem != 'null'
          table.insert result, elem

    _flatten input
    result
}
