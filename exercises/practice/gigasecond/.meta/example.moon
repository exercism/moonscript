tz = require 'tz'       -- https://luarocks.org/modules/anaef/lua-tz

GIGASECOND = 1e9
DATE_FORMAT = '%Y-%m-%dT%H:%M:%S'
DATE_PATTERN = '^(%d%d%d%d)-(%d%d)-(%d%d)T(%d%d):(%d%d):(%d%d)$'

parse = (timestamp) ->
  local m
  spec = -> {year: m[1], month: m[2], day: m[3], hour: m[4], min: m[5], sec: m[6]}

  m = table.pack timestamp\match DATE_PATTERN
  return spec! if m.n > 1

  m = table.pack (timestamp .. 'T00:00:00')\match DATE_PATTERN
  return spec! if m.n > 1

  error "can't parse \"#{timestamp}\""

  
{
  add: (timestamp) ->
    time = tz.time parse(timestamp), 'UTC'
    tz.date DATE_FORMAT, time + GIGASECOND, 'UTC'
    -- os.date works here too: os.date '!...', time + GIGASECOND
}
