nums = {[0]: "No", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"}

bottles = (n) -> "#{nums[n]} green bottle#{n == 1 and "" or "s"}"

verse = (v) ->
  lines = {
    "#{bottles v} hanging on the wall,"
    "And if one green bottle should accidentally fall,"
    "There'll be #{string.lower bottles v - 1} hanging on the wall."
  }
  table.insert lines, 1, lines[1]
  table.concat lines, '\n'

{
  recite: (first, count) ->
    table.concat [verse(v) for v = first, first - count + 1, -1], '\n\n'
}
