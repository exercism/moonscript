nth = { 'first', 'second', 'third', 'fourth', 'fifth', 'sixth', 'seventh',
        'eighth', 'ninth', 'tenth', 'eleventh', 'twelfth' }

presents = {
  'a Partridge in a Pear Tree',
  'two Turtle Doves',
  'three French Hens',
  'four Calling Birds',
  'five Gold Rings',
  'six Geese-a-Laying',
  'seven Swans-a-Swimming',
  'eight Maids-a-Milking',
  'nine Ladies Dancing',
  'ten Lords-a-Leaping',
  'eleven Pipers Piping',
  'twelve Drummers Drumming',
}

gifts = (n) ->
  items = {}
  table.insert items, 1, presents[i] for i = 1, n
  items[#items] = "and #{items[#items]}" if n > 1
  table.concat items, ', '


verse = (n) ->
  "On the #{nth[n]} day of Christmas my true love gave to me: #{gifts n}."

{
  recite: (start, stop) -> [verse i for i = start, stop]
}
