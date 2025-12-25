-- Change making algorithm from
-- http://www.ccs.neu.edu/home/jaa/CSG713.04F/Information/Handouts/dyn_prog.pdf

-- This function generates two arrays:
--
-- C = maps the minimum number of coins required to make
--     change for each n from 1 to amount.
--     It is returned but only used internally in this
--     application.
--
-- S = the _first_ coin used to make change for amount n
--     (actually stores the coin _index_ into the
--     denominations array)
--
change = (amount, denominations) ->
  C = {[0]: 0}
  S = {}

  for p = 1, amount
    min = math.maxinteger
    coin_idx = nil

    for i = 1, #denominations
      if denominations[i] <= p
        if C[p - denominations[i]] < min
          min = 1 + C[p - denominations[i]]
          coin_idx = i

    C[p] = min
    S[p] = coin_idx

  C, S


change_maker = (S, d, n) ->
  result = {}
  while n > 0
    coin = d[S[n]]
    assert coin, "can't make target with given coins"

    table.insert result, 1, coin
    n -= coin
  result
  

{
  make_change: (amount, coins) ->
    assert amount >= 0, "target can't be negative"
    _, first_coin = change amount, coins
    change_maker first_coin, coins, amount
}
