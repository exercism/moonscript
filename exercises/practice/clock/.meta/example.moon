class Clock
  new: (argument) =>
    { :hour, :minute } = argument
    @_min = @normalize 60 * hour + minute

  normalize: (minutes) =>
    mins_per_day = 24 * 60
    minutes % mins_per_day

  __tostring: =>
    string.format '%02d:%02d', @_min // 60, @_min % 60

  add: (minutes) =>
    @_min = @normalize @_min + minutes

  subtract: (minutes) =>
    @add -minutes

  equals: (a_clock) =>
    @_min == a_clock._min
