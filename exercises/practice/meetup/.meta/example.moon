is_teenth = (time) ->
  day = tonumber os.date '%d', time
  13 <= day and day <= 19

{
  meetup: (input) ->
    {:year, :month, :week, :dayofweek} = input

    days = {}
    t = {:year, :month, day: 0}
    while true
      t.day += 1
      time = os.time t
      if month != tonumber os.date '%m', time
        break
      if dayofweek == os.date '%A', time
        table.insert days, time

    idx = switch week
      when 'first'  then 1
      when 'second' then 2
      when 'third'  then 3
      when 'fourth' then 4
      when 'last'   then #days
      when 'teenth' then is_teenth(days[2]) and 2 or 3

    os.date '%Y-%m-%d', days[idx]
}
