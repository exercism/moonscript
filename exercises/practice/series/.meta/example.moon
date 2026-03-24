{
  slices: (series, length) ->
    assert length > -1, 'slice length cannot be negative'
    assert length > 0, 'slice length cannot be zero'
    assert #series > 0, 'series cannot be empty'
    assert #series >= length, 'slice length cannot be greater than series length'

    -- a "stateful iterator"
    idx = 0
    last = #series - length
    ->
      if idx <= last
        idx += 1
        return series\sub(idx, idx + length - 1)
}
