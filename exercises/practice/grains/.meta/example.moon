{
  square: (n) ->
    error 'square must be between 1 and 64' unless n >= 1 and n <= 64
    2 ^ (n - 1)

  total: ->
    2 ^ 64 - 1
}
