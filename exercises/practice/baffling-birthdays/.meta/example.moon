YearDates = [os.date('%m-%d', os.time {year: 2001, month: 1, day: d}) for d = 1, 365]

isLeapYear = (y) -> y % 4 == 0 and (y % 100 != 0 or y % 400 == 0)

randomYear = ->
  year = 1900 + math.random 126
  isLeapYear(year) and randomYear! or year

randomBirthdate = -> "#{randomYear!}-#{YearDates[math.random #YearDates]}"

sharedBirthday = (birthdates) ->
  if #birthdates > 1
    dates = {}
    for date in *[bd\sub 6 for bd in *birthdates]
      dates[date] = (dates[date] or 0) + 1
      return true if dates[date] > 1
  false

randomBirthdates = (n) ->
  [randomBirthdate! for _ = 1, n]

estimatedProbabilityOfSharedBirthday = (n) ->
  iterations = 10000
  shared = 0
  if n > 1
    for i = 1, iterations
      if sharedBirthday randomBirthdates n
        shared += 1
  100.0 * shared / iterations

{ :sharedBirthday, :randomBirthdates, :estimatedProbabilityOfSharedBirthday }
