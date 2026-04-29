-- following pseudocode under
-- https://en.wikipedia.org/wiki/Knapsack_problem#0-1_knapsack_problem
{ 
  maximumValue: (maxWt, items) ->
    n = #items
    -- using table comprehension syntax
    -- because we need to have index 0 in both dimensions
    m = {i, {j, 0 for j = 0, maxWt} for i = 0, n}
    for i = 1, n
      for j = 1, maxWt
        if items[i].weight > j
          m[i][j] = m[i - 1][j]
        else
          m[i][j] = math.max(m[i - 1][j], m[i - 1][j - items[i].weight] + items[i].value)
    m[n][maxWt] 
}
