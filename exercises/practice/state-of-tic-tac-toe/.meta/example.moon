WINNING_COMBOS = {
  tonumber('111000000', 2)
  tonumber('000111000', 2)
  tonumber('000000111', 2)
  tonumber('100100100', 2)
  tonumber('010010010', 2)
  tonumber('001001001', 2)
  tonumber('100010001', 2)
  tonumber('001010100', 2)
}

has_won = (state) ->
  for combo in *WINNING_COMBOS
    if state & combo == combo
      return true
  false

state = (player, board) ->
  value = 0
  n = 0
  for i, p in ipairs board
    if p == player
      value |= 1 << i-1
      n += 1
  {:n, won: has_won value}


{
  gamestate: (board) ->
    board = [c for c in table.concat(board)\gmatch '.']
    x = state 'X', board
    o = state 'O', board

    if x.won and o.won
      error 'Impossible board: game should have ended after the game was won'
    elseif x.n > o.n + 1
      error 'Wrong turn order: X went twice'
    elseif o.n > x.n
      error 'Wrong turn order: O started'
    elseif x.won or o.won
      'win'
    elseif x.n + o.n == 9
      'draw'
    else
      'ongoing'
}
