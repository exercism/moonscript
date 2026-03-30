QUARTER_END = {
  {month: 3, day: 31}
  {month: 6, day: 30}
  {month: 9, day: 30}
  {month: 12, day: 31}
}

now = (spec) ->
  with spec
    .hour += 2

asap = (spec) ->
  with spec
    .day += (.hour < 13 and 0 or 1)
    .hour = (.hour < 13 and 17 or 13)
    .min = 0

eow = (spec) ->
  dow = tonumber os.date '%w', os.time spec
  switch dow
    when 1, 2, 3
      -- want dow = 5, Friday
      spec.day += 5 - dow
      spec.hour = 17
    when 4, 5
      spec.day += 7 - dow
      spec.hour = 20
  with spec
    .min = 0

month = (spec, m) ->
  spec = {
    year: spec.year + (spec.month < m and 0 or 1)
    month: m
    day: 1
    hour: 8
  }
  switch os.date '%w', os.time spec
    when '0' then spec.day += 1
    when '6' then spec.day += 2
  -- os.time normalizes the table it's given.
  -- This can cause off-by-one DST errors unless we unset
  -- the isdst field.
  with spec
    .isdst = nil

quarter = (spec, q) ->
  current_quarter = 1 + spec.month // 3
  spec = {
    year: spec.year + (current_quarter > q and 1 or 0)
    month: QUARTER_END[q].month
    day: QUARTER_END[q].day
    hour: 8
  }
  switch os.date '%w', os.time spec
    when '0' then spec.day -= 2
    when '6' then spec.day -= 1
  with spec
    .isdst = nil

-- ------------------------------------------------------------
delivery_date = (code, timestamp) ->
  dt = [tonumber n for n in timestamp\gmatch '%d+']
  assert #dt == 6, "can't parse timestamp '#{timestamp}'"
  timespec = {
    year: dt[1]
    month: dt[2]
    day: dt[3]
    hour: dt[4]
    min: dt[5]
    sec: dt[6]
  }

  timespec = switch code
    when 'NOW' then now timespec
    when 'ASAP' then asap timespec
    when 'EOW' then eow timespec
    else
      m = code\match '(%d+)M'
      q = code\match 'Q([1234])'
      if m then month timespec, tonumber m
      elseif q then quarter timespec, tonumber q
      else error "unknown code #{code}"

  os.date '%Y-%m-%dT%H:%M:%S', os.time timespec

{ :delivery_date }
