import fold from require 'moon'

product = (...) -> fold {1, ...}, (p, d) -> p * d

refute = (cond, msg) -> assert not cond, msg

{
  largest_product: (digits, span) ->
    return 1 if span == 0

    assert span >= 0, 'span must not be negative'
    assert span <= #digits, 'span must not exceed string length'
    refute digits\find('[^%d]'), 'digits input must only contain digits'

    ds = [tonumber c for c in digits\gmatch('.')]
    prods = [product table.unpack(ds, i, i + span - 1) for i = 1, #ds - (span - 1)]
    math.max table.unpack prods
}
