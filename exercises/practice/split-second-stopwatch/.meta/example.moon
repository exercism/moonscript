class Stopwatch
  new: => @reset!

  state: => @_state

  currentLap: => @_timestamp @_lapSeconds

  total: => @_timestamp @_totalSeconds

  previousLaps: => @_laps

  start: =>
    if @_state == 'running'
      error "cannot start an already running stopwatch"
    @_state = 'running'

  stop: =>
    if @_state != 'running'
      error "cannot stop a stopwatch that is not running"
    @_state = 'stopped'

  lap: =>
    if @_state != 'running'
      error "cannot lap a stopwatch that is not running"
    table.insert @_laps, @currentLap!
    @_lapSeconds = 0

  reset: =>
    if @_state and @_state != 'stopped'
      error "cannot reset a stopwatch that is not stopped"
    @_state = 'ready'
    @_totalSeconds = 0
    @_lapSeconds = 0
    @_laps = {}

  advanceTime: (duration) =>
    return unless @_state == 'running'
    seconds = @_asSeconds duration
    @_totalSeconds += seconds
    @_lapSeconds += seconds

  _asSeconds: (timestamp) =>
    h, m, s = unpack [tonumber x for x in timestamp\gmatch "%d+"]
    h * 3600 + m * 60 + s

  _timestamp: (seconds) =>
    h = math.floor seconds / 3600
    m = math.floor (seconds % 3600) / 60
    s = seconds % 60
    string.format "%02d:%02d:%02d", h, m, s

{ :Stopwatch }
