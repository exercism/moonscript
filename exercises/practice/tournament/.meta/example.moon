class Team
  new: (name) =>
    @name = name
    @wins, @losses, @draws = 0, 0, 0

  win: => @wins += 1
  loss: => @losses += 1
  draw: => @draws += 1

  points: => 3 * @wins + @draws
  
  data: =>
    table.unpack {
      @name
      @wins + @losses + @draws
      @wins
      @draws
      @losses
      @points!
    }

  __lt: (other) =>
    return true if @points! > other\points!
    return true if @points! == other\points! and @name < other.name
    false

-- ----------------------------------------------------------------
FMT = "%-30s | %2s | %2s | %2s | %2s | %2s"
HEAD = FMT\format 'Team', 'MP', 'W', 'D', 'L', 'P'

class Tournament
  new: =>
    @teams = {}
  
  record: (team1, team2, result) =>
    home = @teams[team1] or Team team1
    away = @teams[team2] or Team team2

    switch result
      when "win"
        home\win!
        away\loss!
      when "loss"
        home\loss!
        away\win!
      when "draw"
        home\draw!
        away\draw!

    @teams[team1] = home
    @teams[team2] = away

  standings: =>
    teams = [team for _, team in pairs @teams]
    table.sort teams
    standings = [FMT\format team\data! for team in *teams]
    table.insert standings, 1, HEAD
    standings

-- ----------------------------------------------------------------
{
  tally: (filename) ->
    t = Tournament!
    file = io.open filename, 'r'
    for line in file\lines!
      team1, team2, result = line\match '([^;]+);([^;]+);([^;]+)'
      if team1
        t\record team1, team2, result
    file\close!
    t\standings!
}
