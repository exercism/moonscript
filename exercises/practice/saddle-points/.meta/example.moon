{
  saddle_points: (mtx) ->
    nrow, ncol = #mtx, #mtx[1]

    row_max = [math.mininteger for _ = 1, nrow]
    col_min = [math.maxinteger for _ = 1, ncol]

    for r = 1, nrow
      for c = 1, ncol
        row_max[r] = math.max row_max[r], mtx[r][c]
        col_min[c] = math.min col_min[c], mtx[r][c]

    results = {}
    for r = 1, nrow
      for c = 1, ncol
        if row_max[r] == mtx[r][c] and col_min[c] == mtx[r][c]
          table.insert results, {row: r, column: c}

    results
}
