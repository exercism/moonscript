Gigasecond = require 'gigasecond'

describe 'gigasecond', ->
  it 'date only specification of time', ->
    momentA = os.time {year: 2011, month: 4, day: 25, hour: 0, min: 0, sec: 0}
    momentB = os.time {year: 2043, month: 1, day: 1, hour: 1, min: 46, sec: 40}
    result = os.date '!%x', Gigasecond.add momentA
    expected = os.date '!%x', momentB
    assert.are.equals expected, result

  pending 'second test for date only specification of time', ->
    momentA = os.time {year: 1977, month: 6, day: 13, hour: 0, min: 0, sec: 0}
    momentB = os.time {year: 2009, month: 2, day: 19, hour: 1, min: 46, sec: 40}
    result = os.date '!%x', Gigasecond.add momentA
    expected = os.date '!%x', momentB
    assert.are.equals expected, result

  pending 'third test for date only specification of time', ->
    momentA = os.time {year: 1959, month: 7, day: 19, hour: 0, min: 0, sec: 0}
    momentB = os.time {year: 1991, month: 3, day: 27, hour: 1, min: 46, sec: 40}
    result = os.date '!%x', Gigasecond.add momentA
    expected = os.date '!%x', momentB
    assert.are.equals expected, result

  pending 'full time specified', ->
    momentA = os.time {year: 2015, month: 1, day: 24, hour: 22, min: 0, sec: 0}
    momentB = os.time {year: 2046, month: 10, day: 2, hour: 23, min: 46, sec: 40}
    result = os.date '!%x', Gigasecond.add momentA
    expected = os.date '!%x', momentB
    assert.are.equals expected, result

  pending 'full time with day roll-over', ->
    momentA = os.time {year: 2015, month: 1, day: 24, hour: 23, min: 59, sec: 59}
    momentB = os.time {year: 2046, month: 10, day: 3, hour: 1, min: 46, sec: 39}
    result = os.date '!%x', Gigasecond.add momentA
    expected = os.date '!%x', momentB
    assert.are.equals expected, result
