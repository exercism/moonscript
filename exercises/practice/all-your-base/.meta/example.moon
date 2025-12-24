{
  rebase: (arg) ->
    { :in_base, :out_base, :digits } = arg

    assert in_base >= 2, 'input base must be >= 2'
    assert out_base >= 2, 'output base must be >= 2'

    decimal = 0
    for d in *digits
      assert 0 <= d and d < in_base, 'all digits must satisfy 0 <= d < input base'
      decimal = decimal * in_base + d

    return {0} if decimal == 0

    out_digits = {}
    while decimal > 0
      table.insert out_digits, 1, decimal % out_base
      decimal = decimal // out_base
    out_digits
}
