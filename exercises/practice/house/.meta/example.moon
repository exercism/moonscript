data = {
  {'house', 'Jack built.'}
  {'malt', 'lay in'}
  {'rat', 'ate'}
  {'cat', 'killed'}
  {'dog', 'worried'}
  {'cow with the crumpled horn', 'tossed'}
  {'maiden all forlorn', 'milked'}
  {'man all tattered and torn', 'kissed'}
  {'priest all shaven and shorn', 'married'}
  {'rooster that crowed in the morn', 'woke'}
  {'farmer sowing his corn', 'kept'}
  {'horse and the hound and the horn', 'belonged to'}
}

verse = (n) ->
  things = ["the #{data[i][1]} that #{data[i][2]}" for i = n, 1, -1]
  'This is ' .. table.concat things, ' '

{
  recite: (start, stop) ->
    [verse n for n = start, stop]
}
