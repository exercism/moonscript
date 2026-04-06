class HighScores
  new: (@_scores) =>
    @_sorted = [s for s in *@_scores]
    table.sort @_sorted, (a, b) -> b < a

  scores: => @_scores
  latest: => @_scores[#@_scores]
  personalBest: => @_sorted[1]
  personalTopThree: => {table.unpack @_sorted, 1, 3}
