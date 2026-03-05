components = (moment) -> moment\match "(%d%d%d%d)%-(%d%d)%-(%d%d)T?(%d*):?(%d*):?(%d*)"
to_num = (str) -> str != '' and tonumber(str) or 0

{
  module_name: 'Gigasecond',

  generate_test: (case, level) ->
    lines = {}

    year, month, day, hour, min, sec = unpack [to_num v for v in *{components case.input.moment}]
    table.insert lines, "momentA = os.time {year: #{year}, month: #{month}, day: #{day}, hour: #{hour}, min: #{min}, sec: #{sec}}"

    e_year, e_month, e_day, e_hour, e_min, e_sec = unpack [to_num v for v in *{components case.expected}]
    table.insert lines, "momentB = os.time {year: #{e_year}, month: #{e_month}, day: #{e_day}, hour: #{e_hour}, min: #{e_min}, sec: #{e_sec}}"

    table.insert lines, "result = os.date '!%x', Gigasecond.add momentA"
    table.insert lines, "expected = os.date '!%x', momentB"
    table.insert lines, "assert.are.equals expected, result"

    
    table.concat [indent line, level for line in *lines], '\n'
}
