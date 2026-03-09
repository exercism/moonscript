{
  keep: (list, predicate) ->
    [item for item in *list when predicate(item)]

  discard: (list, predicate) ->
    [item for item in *list when not predicate(item)]
}
