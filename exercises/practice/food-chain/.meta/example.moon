animals = {'fly', 'spider', 'bird', 'cat', 'dog', 'goat', 'cow', 'horse'}
phrases = {
  fly: "I don't know why she swallowed the fly. Perhaps she'll die.",
  spider: 'It wriggled and jiggled and tickled inside her.',
  bird: 'How absurd to swallow a bird!',
  cat: 'Imagine that, to swallow a cat!',
  dog: 'What a hog, to swallow a dog!',
  goat: 'Just opened her throat and swallowed a goat!',
  cow: "I don't know how she swallowed a cow!",
  horse: "She's dead, of course!",
}
extra = {
  spider: ' that wriggled and jiggled and tickled inside her'
}

predator = (i) -> animals[i]
prey = (i) -> animals[i] .. (extra[animals[i]] or '')

verse = (n) ->
  animal = animals[n]
  lines = { "I know an old lady who swallowed a #{animal}." }
  lines[#lines + 1] = phrases[animal]
  if n > 1 and n < #animals
    for i = n, 2, -1
      lines[#lines + 1] = "She swallowed the #{predator i} to catch the #{prey i-1}."
    lines[#lines + 1] = phrases.fly
  table.concat lines, '\n'

{
  recite: (startVerse, endVerse) ->
    table.concat [verse i for i = startVerse, endVerse], '\n\n'
}
